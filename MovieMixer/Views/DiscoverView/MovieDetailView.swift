//
//  MovieDetailView.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {

    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    let movie: Movie
    let headerHeight: CGFloat = 400
    @State var isOpenReview: Bool = false
  
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
                           
                        }label: {
                            
                                
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
                        
                        Text("Runtime: \(model.details?.runtime ?? 0)")
                            .foregroundColor(.white)
    
                        
                    }

                    HStack {
                        Text("About film")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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
                            Text("Read more")
                        }
                        else {
                            Text("Close")
                        }
                    }

                    HStack {
                        Text("Cast & Crew")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        // see all button
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(model.castProfiles) { cast in
                                CastView(cast: cast)
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
            await model.movieCredits(for: movie.id)
            await model.loadCastProfiles()
            await model.movieDetails(for: movie.id)
        }
    }

}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}
