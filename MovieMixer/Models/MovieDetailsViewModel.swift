//
//  MovieDetailsViewModel.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import Foundation
import Combine
import CoreData

@MainActor
class MovieDetailsViewModel: ObservableObject {


    

    @Published var credits: MovieCredits?
    @Published var cast: [MovieCredits.Cast] = []
    @Published var castProfiles: [Person] = []
    @Published var details: MovieDetails?
    @Published var personDetails: Person?
    @Published var isLoading: Bool = false
    
    
    @Published var language: String = "ru"
    
    

    @Published var isFavourite: Bool = false



    func getLanguage(language: Language) {
        self.language = language.language.rawValue
    }

    func movieCredits(for movieID: Int) async {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let credits = try JSONDecoder().decode(MovieCredits.self, from: data)
            self.credits = credits
            self.cast = credits.cast.sorted(by: { $0.order < $1.order })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func movieDetails(for movieID: Int) async {
        isLoading = true
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let details = try JSONDecoder().decode(MovieDetails.self, from: data)
            self.details = details
            isLoading = false
      
        } catch {
            print(error.localizedDescription)
        }
    }

    func loadCastProfiles() async {
        do {
            for member in cast {
                let url = URL(string: "https://api.themoviedb.org/3/person/\(member.id)?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let profile = try JSONDecoder().decode(Person.self, from: data)
                castProfiles.append(profile)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func personDetails(for personID: Int) async {
        isLoading = true
        let url = URL(string: "https://api.themoviedb.org/3/person/\(personID)?api_key=\(MovieDiscoverViewModel.apiKey)&language=\(language)")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let details = try JSONDecoder().decode(Person.self, from: data)
            self.personDetails = details
            isLoading = false
      
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
  
    
}

/*struct CastProfile: Decodable, Identifiable {

    let birthday: String?
    let id: Int
    let name: String
    let profile_path: String?

    var photoUrl: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w200")
        return baseURL?.appending(path: profile_path ?? "")
    }
}*/

struct MovieCredits: Decodable {

    let id: Int
    let cast: [Cast]

    struct Cast: Decodable, Identifiable {
        let name: String
        let id: Int
        let character: String
        let order: Int
    }
}
