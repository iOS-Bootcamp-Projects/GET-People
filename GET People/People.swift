//
//  Peoplw.swift
//  GET People
//
//  Created by Aamer Essa on 06/12/2022.
//

import Foundation

struct People: Codable {
    var results :[Person]
}

struct Person: Codable{
    
    var name: String
    var height:String
    var mass: String
    var hair_color : String
    var skin_color : String
    var eye_color: String
    var birth_year: String
    var gender: String
    var homeworld: String
    var films: [String]
    var species: [String]
    var vehicles: [String]
    var starships: [String]

    
    
}
