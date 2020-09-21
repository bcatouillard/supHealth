//
//  Country.swift
//  covid
//
//  Created by Benjamin on 21/09/2020.
//  Copyright © 2020 Benjamin. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let country = try? newJSONDecoder().decode(Country.self, from: jsonData)

import Foundation

// MARK: - Country
struct Country: Codable {
    let countries: [CountryElement]

    enum CodingKeys: String, CodingKey {
        case countries = "Countries"
    }
}

// MARK: - CountryElement
struct CountryElement: Codable {
    let country, countryCode, slug: String
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int
    let newRecovered, totalRecovered: Int

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
