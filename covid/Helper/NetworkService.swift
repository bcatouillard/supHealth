//
//  NetworkService.swift
//  covid
//
//  Created by Benjamin on 21/09/2020.
//  Copyright © 2020 Benjamin. All rights reserved.
//

import Foundation

protocol NetworkServiceDelegate {
    func didFetchData(data: Country)
}

struct NetworkService {
    var delegate: NetworkServiceDelegate?
    
    func getData(){

        var request = URLRequest.init(url: URL(string: "https://api.covid19api.com/summary")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let report = try! jsonDecoder.decode(Country.self, from: data)
                DispatchQueue.main.sync {
                    self.delegate?.didFetchData(data: report)
                }
            } else if let error = error {
                print(error)
            }
        }.resume()
    }
}
