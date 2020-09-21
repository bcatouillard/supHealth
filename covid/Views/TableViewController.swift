//
//  ViewController.swift
//  covid
//
//  Created by Benjamin on 21/09/2020.
//  Copyright © 2020 Benjamin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, NetworkServiceDelegate {
    
    var dataArray = Country.init(countries: [CountryElement(country: "", countryCode: "", slug: "", newConfirmed: 0, totalConfirmed: 0, newDeaths: 0, totalDeaths: 0, newRecovered: 0, totalRecovered: 0)])
    var callAPI = NetworkService()
    var index: Int = 0
    var filteredCountry: [CountryElement] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    func filterContentForSearchText(_ searchText: String){
        filteredCountry = dataArray.countries.filter { (country: CountryElement) -> Bool in
          return country.country.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    func didFetchData(data: Country) {
        dataArray = data
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI.delegate = self
        callAPI.getData()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredCountry.count
        }
        
        return dataArray.countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var country: Country
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! TableViewCell
        if isFiltering {
            country = Country(countries: filteredCountry)
        } else{
            country = dataArray
        }
        cell.countryNameLabel.text = country.countries[indexPath.row].country
        cell.countryFlagImageView.load(url: URL(string: "https://www.countryflags.io/\(country.countries[indexPath.row].countryCode)/flat/64.png")!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destination = segue.destination as! DetailedViewController
            destination.countryArray = dataArray.countries[tableView.indexPathForSelectedRow!.row]
        }
    }
}

extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
