//
//  GenerationView.swift
//  MovieMixer
//
//  Created by User on 5.05.23.
//

import SwiftUI

struct GenerationView: View {

    @EnvironmentObject var favorite: Favorites
    @EnvironmentObject var language: Language

    
    var body: some View{
        NavigationStack{
            ScrollView{
                LazyVStack() {
                    HStack{
                        if language.language == .en{
                            Text("Choose the film you like the most:")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 10.0)
                        }
                        else {
                            Text("Выберите фильм который вам больше всего понравился:")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 10.0)
                        }
                        Spacer()
                    }
                    ForEach(favorite.favoriteMovies) { item in
                        NavigationLink{
                            RecommendationView(movie: item)
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

struct GenerationView_Previews: PreviewProvider {
    static var previews: some View {
        GenerationView()
            .environmentObject(Favorites())
            .environmentObject(Language())
    }
}
