//
//  Person.swift
//  MovieMixer
//
//  Created by User on 1.05.23.
//

import Foundation

struct Person: Decodable, Identifiable {
    let birthday: String
    let known_for_department: String
    let id: Int
    let name: String
    let biography: String
    let popularity: Double
    let place_of_birth: String
    let profile_path: String
    
    var profileURL: URL {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w200")
        return (baseURL?.appending(path: profile_path ))!
    }
}
