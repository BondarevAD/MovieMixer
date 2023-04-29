//
//  DiscoverView.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import SwiftUI

struct DiscoverView: View {

    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var searchText = ""
    

    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    if viewModel.trending.isEmpty {
                        Text("No Results")
                    } else {
                        HStack {
                            Text("Trending")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal
                        )
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.trending) { trendingItem in
                                    NavigationLink {
                                        MovieDetailView(movie: trendingItem)
                                    } label: {
                                        TrendingCard(trendingItem: trendingItem)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                } else {
                    LazyVStack() {
                        ForEach(viewModel.searchResults) { item in
                            NavigationLink{
                                MovieDetailView(movie: item)
                            }label: {
                                SearchCardView(item: item)
                                    
                            }
                                
                            .padding()
                            .background(Color(red:61/255,green:61/255,blue:88/255))
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea())
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            if newValue.count > 2 {
                viewModel.search(term: newValue)
            }
        }
        .onAppear {
            viewModel.loadTrending()
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

