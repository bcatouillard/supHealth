//
//  DetailedViewController.swift
//  covid
//
//  Created by Benjamin on 21/09/2020.
//  Copyright © 2020 Benjamin. All rights reserved.
//

import Foundation
import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var contaminedLabel: UILabel!
    @IBOutlet weak var curedLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    
    var countryArray: CountryElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryNameLabel.text = countryArray.country
        flagImageView.load(url: URL(string: "https://www.countryflags.io/\(countryArray.countryCode)/flat/64.png")!)
        contaminedLabel.text = String(countryArray.totalConfirmed)
        deathLabel.text = String(countryArray.totalDeaths)
        curedLabel.text = String(countryArray.totalRecovered)
        
        
    }
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        let message = "Stats du pays : \(countryArray.country) : Total cas : \(countryArray.totalConfirmed) Total morts : \(countryArray.totalDeaths) Total guéris : \(countryArray.totalRecovered)"

                   let objectsToShare = [message]
                   let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                    self.present(activityVC, animated: true, completion: nil)
               
    }
}
