//
//  MovieDetails.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import Foundation

struct MovieDetails: Decodable, Identifiable {
    var id: Int
    var runtime: Int?
    var genres:[Genre]
}
