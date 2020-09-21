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
    
    func didFetchData(data: Country) {
        dataArray = data
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI.delegate = self
        callAPI.getData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as! TableViewCell
        cell.countryNameLabel.text = dataArray.countries[indexPath.row].country
        cell.countryFlagImageView.load(url: URL(string: "https://www.countryflags.io/\(dataArray.countries[indexPath.row].countryCode)/flat/64.png")!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
    }
}
