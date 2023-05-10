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
    @EnvironmentObject var language: Language
    @State var reload: Bool = false
    
    
    var body: some View {
        VStack{
            if viewModel.trending.isEmpty {
                ProgressView()
            } else {
                VStack{
                    
    
                    NavigationStack {
                        

                        ScrollView {
                            if searchText.isEmpty {
                                ZStack(alignment: .bottom){
                                    ScrollView{
                                        TrendingView(trending: viewModel.trending, language: language)
                                        
                                        PopularView(popular: viewModel.popular, language: language)
                                        
                                        UpcomingView(upcoming: viewModel.upcoming, language: language)
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
                                        .background(Color(red:61/255,green:61/255,blue:88/255)
                                            .ignoresSafeArea())
                                        .cornerRadius(20)
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .background(Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea())
                    }
                    .searchable(text: $searchText, prompt: "Find")
                    .onChange(of: searchText) { newValue in
                        if newValue.count > 2 {
                            viewModel.search(term: newValue)
                        }
                    }
                    
                    .sheet(isPresented: $viewModel.isShown) {
                        GenerationView()
                    }
                    .safeAreaInset(edge: .bottom, alignment: .leading) {
                        
                       
                            GenerateButton(model: viewModel)
                       
                            
                    }
                    
                    
                    
                }
                .background(Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea())
            }
        }
        .onAppear{
            viewModel.loadTrending()
            viewModel.loadPopular()
            viewModel.loadUpcoming()
            viewModel.getLanguage(language: language)
                
        }
    }
}


                
        

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            .environmentObject(Favorites())
            .environmentObject(Language())
    }
}

