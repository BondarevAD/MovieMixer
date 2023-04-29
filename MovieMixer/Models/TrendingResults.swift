//
//  TrendingResults.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import Foundation

struct TrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
