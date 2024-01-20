//
//  SheetViewModel.swift
//  list
//
//  Created by Arshad Mustafa on 18/01/2024.
//

import Foundation

class SheetViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var category: String = ""
    func reset() {
        name = ""
        email = ""
        password = ""
        category = ""
    }
}
