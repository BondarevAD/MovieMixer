//
//  DiscoverCard.swift
//  MovieMixer
//
//  Created by User on 29.04.23.
//

import SwiftUI

import Foundation
import SwiftUI

struct CastView: View {

    let cast: CastProfile

    var body: some View {
        VStack {
            AsyncImage(url: cast.photoUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 120)
            }
            Text(cast.name)
                .lineLimit(1)
                .frame(width: 100)
                .foregroundColor(.white)
        }
    }

}

struct CastView_Previews: PreviewProvider {
    static var previews: some View {
        CastView(cast: CastProfile(birthday: "333", id: 1, name: "Stolin", profile_path: "djjdjd"))
    }
}
