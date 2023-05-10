//
//  MovieDiscoverViewMOdel.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import Foundation

@MainActor
class MovieDiscoverViewModel: ObservableObject {

    @Published var trending: [Movie] = []
    @Published var searchResults: [Movie] = []
    @Published var popular: [Movie] = []
    @Published var upcoming: [Movie] = []
    @Published var isShown = false
    
    @Published var language: String = "ru"
    
    func getLanguage(language: Language) {
        self.language = language.language.rawValue
    }
    
    func refresh() {
        loadTrending()
        loadPopular()
        loadTrending()
    }

    
    @Published var favouriteMovies: [Movie] = []
    
    @Published var isDiscovery = false

    static let apiKey = "ab8ca7862f2733af2356c592de5f9d45"
   
    func loadTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                trending = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func search(term: String) {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)&page=1&include_adult=false&query=\(term)".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                searchResults = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadPopular() {
    
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                popular = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadUpcoming() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                upcoming = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func hideBar() {
        isDiscovery.toggle()
    }

}
