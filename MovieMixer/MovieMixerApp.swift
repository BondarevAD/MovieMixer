//
//  MovieMixerApp.swift
//  MovieMixer
//
//  Created by User on 24.04.23.
//

import SwiftUI

@main
struct MovieMixerApp: App {
    @StateObject var favorites = Favorites()
    @StateObject var language = Language()
    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoverView()
                    .tabItem {
                        Image(systemName: "popcorn.fill")
                            .foregroundColor(.white)
                    }
                    .toolbar(.visible, for: .tabBar)

                            .toolbarBackground(Color(red:39/255,green:40/255,blue:59/255), for: .tabBar)
                    FavouritesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                    }
                    .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color(red:39/255,green:40/255,blue:59/255), for: .tabBar)
                SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.white)
                }
                .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color(red:39/255,green:40/255,blue:59/255), for: .tabBar)
            }
           
            .environmentObject(favorites)
            .environmentObject(language)
        }
    }
}
