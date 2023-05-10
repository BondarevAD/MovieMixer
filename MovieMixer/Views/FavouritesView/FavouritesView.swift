//
//  FavouritesView.swift
//  MovieMixer
//
//  Created by User on 2.05.23.
//

import SwiftUI
import CoreData

struct FavouritesView: View {

    @EnvironmentObject var favorites: Favorites
    


    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack() {
                    ForEach(favorites.favoriteMovies) { item in
                        NavigationLink{
                            MovieDetailView(movie: item)
                        }label: {
                            FavoriteCardView(item: item)
                        }
                        
                        .padding()
                        .background(Color(red:61/255,green:61/255,blue:88/255))
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                }
            }
            .background(Color(red:61/255,green:61/255,blue:88/255))
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environmentObject(Favorites())
    }
}
