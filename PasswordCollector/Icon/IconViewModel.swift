//
//  IconViewModel.swift
//  list
//
//  Created by Arshad Mustafa on 18/01/2024.
//

import Foundation

struct IconViewModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
}

extension IconViewModel {
    static let iconList =  [
        IconViewModel(image: "insta", title: "insta"),
        IconViewModel(image: "figma", title: "figma"),
        IconViewModel(image: "twitter", title: "twitter"),
        IconViewModel(image: "snap", title: "snap"),
        IconViewModel(image: "fb", title: "fb"),
        IconViewModel(image: "youtube", title: "youtube"),
        IconViewModel(image: "tiktok", title: "tiktok"),
        IconViewModel(image: "google", title: "google"),
        IconViewModel(image: "pinterest", title: "google"),
        IconViewModel(image: "apple", title: "google"),
        IconViewModel(image: "dribbble", title: "google"),
        IconViewModel(image: "office", title: "google"),
        IconViewModel(image: "skype", title: "google"),
        IconViewModel(image: "linkedin", title: "google"),
        IconViewModel(image: "spotify", title: "google")
        
    ]
}

