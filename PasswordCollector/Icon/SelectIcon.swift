//
//  SelectionIcon.swift
//  PasswordCollector
//
//  Created by Arshad Mustafa on 18/01/2024.
//

import SwiftUI

struct SelectIcon: View {
    var image: String = ""
    @State var action: () -> Void = {}
    var body: some View {
        
        Button(action: action, label: {
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding(12)
                    .cornerRadius(10)
            }
        })
    }
}

#Preview {
    SelectIcon()
}
