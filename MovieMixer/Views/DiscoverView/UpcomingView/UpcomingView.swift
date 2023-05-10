//
//  UpcomingView.swift
//  MovieMixer
//
//  Created by User on 30.04.23.
//

import SwiftUI

struct UpcomingView: View {
    
    var upcoming: [Movie]
    var language: Language
    
    var body: some View {
        HStack {
            if(language.language == .en){
                Text("Upcoming")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            else {
                Text("Скоро выйдут")
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
                ForEach(upcoming) { trendingItem in
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

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView(upcoming: [Movie( adult: true, id: 1, poster_path: "/9dHFRTHP7OAhDTKsmYeDUNAx7Bf.jpg", title: "Stolin", overview: "kjdhjfj", vote_average: 9.2, backdrop_path: "/xzO5m4P7sQGrFtlo8lslT4K0jYb.jpg")], language: Language())
    }
}
