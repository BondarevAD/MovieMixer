//
//  TrendingCard.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import SwiftUI

struct MovieCard: View {

    let trendingItem: Movie
    
    @EnvironmentObject var favorite: Favorites


    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 240)
            } placeholder: {
                Rectangle().fill(Color("CardColor"))
                        .frame(width: 340, height: 240)
            }

            VStack {
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    if(favorite.contains(trendingItem)) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                    
                }
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", trendingItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(red:61/255,green:61/255,blue:88/255))
        }
        .cornerRadius(10)
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(trendingItem: Movie(adult: true, id: 1, poster_path: "/xzO5m4P7sQGrFtlo8lslT4K0jYb.jpg", title: "Stolin", overview: "kjdhjfj", vote_average: 9.2, backdrop_path: "/xzO5m4P7sQGrFtlo8lslT4K0jYb.jpg"))
            .environmentObject(Favorites())
    }
}
