//
//  SearchCardView.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import SwiftUI

struct SearchCardView: View {
    
    var item: Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: item.poster) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 120)
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 120)
            }
            .clipped()
            .cornerRadius(10)

            VStack(alignment:.leading) {
                Text(item.title)
                    .foregroundColor(.white)
                    .font(.headline)

                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", item.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            Spacer()
        }
    }
}

struct SearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCardView(item: Movie( adult: true, id: 1, poster_path: "/9dHFRTHP7OAhDTKsmYeDUNAx7Bf.jpg", title: "Stolin", overview: "kjdhjfj", vote_average: 9.2, backdrop_path: "/xzO5m4P7sQGrFtlo8lslT4K0jYb.jpg"))
    }
}
