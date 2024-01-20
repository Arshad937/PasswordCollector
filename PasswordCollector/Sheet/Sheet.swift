//
//  Sheet.swift
//  list
//
//  Created by Arshad Mustafa on 18/01/2024.
//

import SwiftUI

struct Sheet: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var sheetViewModel: SheetViewModel
    @ObservedObject private var itemStore = ItemStore()
    @Binding var showingSheet: Bool
    let data = IconViewModel.iconList
    @State private var selectedIcon: String?
    //    var onDismiss: () -> Void
    
    var onDismiss: () -> Void
    
    init(sheetViewModel: SheetViewModel, itemStore: ItemStore, showingSheet: Binding<Bool>, onDismiss: @escaping () -> Void) {
        self.sheetViewModel = sheetViewModel
        self.itemStore = itemStore
        self._showingSheet = showingSheet
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    TextField("Name", text: $sheetViewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TextField("Email", text: $sheetViewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TextField("Password", text: $sheetViewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TextField("Category", text: $sheetViewModel.category)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                .padding(.horizontal,50)
                //                LazyHGrid(rows: [GridItem(.adaptive(minimum: 1,maximum: 4))], spacing: 40) {
                LazyHGrid(rows: [GridItem(.fixed(100), spacing: 10),
                                 GridItem(.fixed(100), spacing: 10),GridItem(.fixed(100), spacing: 10)], spacing: 10) {
                    ForEach(data) { item in
                        SelectionIcon(image: item.image) {
                            selectedIcon = item.image
                        }
                    }
                }
                                 .frame(maxHeight: .infinity)
                //                    .background(Color.pink)
                //                }
                
                Button("Add Item") {
                    let newItem = Item(name: self.sheetViewModel.name, email: self.sheetViewModel.email, password: self.sheetViewModel.password, category: self.sheetViewModel.category, icon: selectedIcon)
                    
                    itemStore.addItem(item: newItem)
                    onDismiss()
                    
                    self.showingSheet.toggle()
                    presentationMode.wrappedValue.dismiss()
                    sheetViewModel.reset()
                }
                .padding()
            }
        }
    }
    private func addItem(selectedIcon: String?) {
        if sheetViewModel.name.isEmpty && sheetViewModel.email.isEmpty && sheetViewModel.password.isEmpty {
            print("Required Field")
        } else {
            sheetViewModel.name = ""
            sheetViewModel.email = ""
            sheetViewModel.password = ""
        }
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet(
            sheetViewModel: SheetViewModel(),
            itemStore: ItemStore(),
            showingSheet: .constant(true),
            onDismiss: {}
        )
    }
}
