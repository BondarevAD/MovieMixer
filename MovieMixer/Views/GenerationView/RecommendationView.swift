//
//  RecommendationView.swift
//  MovieMixer
//
//  Created by User on 5.05.23.
//

import SwiftUI

struct RecommendationView: View {
    
    @StateObject var model = MovieGenerationViewModel()
    @State var movie: Movie
    @EnvironmentObject var language: Language
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack() {
                    HStack{
                        if language.language == .en{
                            Text("The best movies for you:")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 10.0)
                        }
                        else {
                            Text("Лучшие фильмы для вас:")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading, 10.0)
                        }
                        Spacer()
                    }
                    ForEach(model.recommendation) { item in
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
            .onAppear {
                Task{
                    await model.recommendations(for: movie.id)
                    model.getLanguage(language: language)
                }
            }
            .background(Color(red:61/255,green:61/255,blue:88/255))
        }
        
    }
}


struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView(movie: Movie( adult: true, id: 1, poster_path: "/9dHFRTHP7OAhDTKsmYeDUNAx7Bf.jpg", title: "Stolin", overview: "kjdhjfj", vote_average: 9.2, backdrop_path: "/xzO5m4P7sQGrFtlo8lslT4K0jYb.jpg"))
            .environmentObject(Language())
    }
}
