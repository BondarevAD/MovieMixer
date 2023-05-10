//
//  Favourite.swift
//  MovieMixer
//
//  Created by User on 4.05.23.
//

import Foundation

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var favourites: Set<Movie>
    
    var favoriteMovies: [Movie] = []

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
    let userDefaults = UserDefaults.standard

    init() {
        
        let favouritesArray = userDefaults.array(forKey: saveKey) as? [Movie]
        favourites = Set(favouritesArray.map { $0 } ?? [].map{$0})
        getFavorites()
    }

    // returns true if our set contains this resort
    func contains(_ movie: Movie) -> Bool {
        var favoritesId: [Int] = []
        for elem in favourites {
            favoritesId.append(elem.id)
        }
        return favoritesId.contains(movie.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ movie: Movie) {
        objectWillChange.send()
        favourites.insert(movie)
        save()
        print(favoriteMovies)
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ movie: Movie) {
        objectWillChange.send()
        favourites.remove(movie)
        print(favoriteMovies)
        save()
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(favourites) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
        getFavorites()
    }
    
    func getFavorites() {

        if let data = userDefaults.object(forKey: saveKey) as? Data,
           let newFavorites = try? JSONDecoder().decode(Set<Movie>.self, from: data) {
             favourites = newFavorites
        }
        favoriteMovies = Array(favourites)
    }
}
