//
//  SettingsView.swift
//  MovieMixer
//
//  Created by User on 8.05.23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var language: Language
    
    var body: some View {
        VStack {
            HStack{
                Text("Settings")
                    .font(.system(size: 45))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.leading, 20.0)
                    
                    
                Spacer()
            }
            HStack{
                Text("Language:")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding([.top, .leading], 20.0)
                Spacer()
                Button {
                    language.changeLanguage()
                } label: {
                    Text(language.language.rawValue)
                }
                .padding([.top, .trailing], 20.0)
                .font(.system(size: 30))
            }
            Spacer()
        }
        .background(Color(red:61/255,green:61/255,blue:88/255))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Language())
    }
}
