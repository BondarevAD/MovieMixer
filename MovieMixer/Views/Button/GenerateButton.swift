//
//  FloatingButton.swift
//  MovieMixer
//
//  Created by User on 5.05.23.
//

import SwiftUI

struct GenerateButton: View {
    //let action: () -> Void
    var model: MovieDiscoverViewModel
    let icon: String  = "repeat"
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button{
                    model.isShown.toggle()
                }label: {
                    Image(systemName: icon)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
                .frame(width: 60, height: 60)
                .background(Color(red:61/255,green:61/255,blue:88/255))
                .cornerRadius(30)
                .shadow(radius: 10)
                .offset(x: -25, y: 0)
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        GenerateButton(model: MovieDiscoverViewModel())
    }
}
