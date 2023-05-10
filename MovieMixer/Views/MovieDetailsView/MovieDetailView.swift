//
//  MovieDetailView.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import Foundation
import SwiftUI
import CoreData

struct MovieDetailView: View {
    
    


    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    @EnvironmentObject var favorites: Favorites
    @EnvironmentObject var language: Language
    let movie: Movie
    let headerHeight: CGFloat = 300
    @State var isOpenReview = false
  
    var body: some View {
        ZStack {
            Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea()

            GeometryReader { geo in
                VStack {
                    AsyncImage(url: movie.backdropURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geo.size.width, maxHeight: headerHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
            }

            ScrollView {
                VStack(spacing: 12) {
                    Spacer()
                        .frame(height: headerHeight)
                    HStack {
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        Spacer()
                        Button {
                            if favorites.contains(movie) {
                                    favorites.remove(movie)
                                } else {
                                    favorites.add(movie)
                                }
                        }label: {
                            if (favorites.contains(movie)) {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 32.0, height: 30.0)
                                    .foregroundColor(Color(.red))
                            }
                            else {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 32.0, height: 30.0)
                                    
                            }
                                
                        
                                
                        }
                    }

                    HStack {
                        VStack{
                            ForEach(model.details?.genres ?? []) {genre in
                                Text(genre.name)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Spacer()
                        if language.language == .en {
                            Text("Runtime: \(model.details?.runtime ?? 0)")
                                .foregroundColor(.white)
                        }
                        else {
                            Text("Продолжительность: \(model.details?.runtime ?? 0)")
                                .foregroundColor(.white)
                        }
    
                        
                    }

                    HStack {
                        if language.language == .en {
                            Text("About film")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        else {
                            Text("О фильме")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    
                    }
                    if isOpenReview {
                        Text(movie.overview)
                            .foregroundColor(.white)
                    }
                    else {
                        Text(movie.overview)
                            .lineLimit(2)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        isOpenReview.toggle()
                    }label: {
                        if !isOpenReview {
                            if language.language == .en {
                                Text("Read more")
                            }
                            else {
                                Text("Узнать больше")
                            }
                        }
                        else {
                            if language.language == .en {
                                Text("Close")
                            }
                            else {
                                Text("Скрыть")
                            }
                        }
                    }

                    HStack {
                        if language.language == .en {
                            Text("Cast & Crew")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        else {
                            Text("Список актеров")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        // see all button
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(model.castProfiles) { cast in
                                NavigationLink {
                                    Button{
                                        
                                    }label: {
                                        PersonDetailsView(person: cast, language: language)
                                    }
                                    
                                } label: {
                                    CastView(cast: cast)
                                }
                            }
                        }
                        
                        
                    }
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
            }
            .padding(.leading)
        }
    
        .toolbar(.hidden, for: .navigationBar)
        .task {
            model.getLanguage(language: language)
            await model.movieCredits(for: movie.id)
            await model.loadCastProfiles()
            await model.movieDetails(for: movie.id)
            
        }
    }
    
    

}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
            .environmentObject(Favorites())
            .environmentObject(Language())
    }
}
