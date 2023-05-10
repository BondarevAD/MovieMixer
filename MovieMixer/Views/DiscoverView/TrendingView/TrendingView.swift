//
//  TrendingView.swift
//  MovieMixer
//
//  Created by User on 30.04.23.
//

import SwiftUI

struct TrendingView: View {
    
    var trending:[Movie]
    var language: Language
    
    var body: some View {
        HStack {
            if(language.language == .en){
                
                Text("Trending")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            else {
                Text("В тренде")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            Spacer()
        }
        .padding(.horizontal
        )
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(trending) { trendingItem in
                    NavigationLink {
                        MovieDetailView(movie: trendingItem)
                           
                    } label: {
                        MovieCard(trendingItem: trendingItem)
                    }
                }
            }
            .padding(.horizontal)
            
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView(trending: [Movie( adult: true, id: 1, poster_path: "/9dHFRTHP7OAhDTKsmYeDUNAx7Bf.jpg", title: "Stolin", overview: "kjdhjfj", vote_average: 9.2, backdrop_path: "/xzO5m4P7sQGrFtlo8lslT4K0jYb.jpg")], language: Language())
            
    }
}
