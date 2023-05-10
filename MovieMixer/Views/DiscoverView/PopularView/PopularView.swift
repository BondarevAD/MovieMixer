//
//  PopularView.swift
//  MovieMixer
//
//  Created by User on 30.04.23.
//

import SwiftUI

struct PopularView: View {
    var popular:[Movie]
    var language: Language
    
    var body: some View {
        HStack {
            if(language.language == .en){
                Text("Popular")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            else {
                Text("Популярное")
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
                ForEach(popular) { trendingItem in
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

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView(popular: [Movie( adult: true, id: 1, poster_path: "/9dHFRTHP7OAhDTKsmYeDUNAx7Bf.jpg", title: "Stolin", overview: "kjdhjfj", vote_average: 9.2, backdrop_path: "/xzO5m4P7sQGrFtlo8lslT4K0jYb.jpg")], language: Language())
    }
}
