//
//  MovieGenerationViewModel.swift
//  MovieMixer
//
//  Created by User on 5.05.23.
//

import Foundation

class MovieGenerationViewModel: ObservableObject {
    @Published var recommendation: [Movie] = []
    @Published var isLoading: Bool = false
        
    @Published var language: String = "ru"
    
    func getLanguage(language: Language) {
        self.language = language.language.rawValue
    }
    func recommendations(for movieID:Int) async {
        isLoading = true
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/recommendations?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let details = try JSONDecoder().decode(TrendingResults.self, from: data)
            self.recommendation = details.results
            isLoading = false
      
        } catch {
            print(error.localizedDescription)
        }
    }
}
