//
//  Language.swift
//  MovieMixer
//
//  Created by User on 7.05.23.
//

import Foundation

class Language: ObservableObject {
    @Published var language: LanguageChoise = .ru
    
    func changeLanguage() {
        if(language == .ru) {
            language = .en
        }
        else {
            language = .ru 
        }
    }
}

enum LanguageChoise: String, CaseIterable {
    case ru = "ru"
    case en = "en-US"
}
