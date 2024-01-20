//
//  ItemsView.swift
//  PasswordCollector
//
//  Created by Arshad Mustafa on 18/01/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var sheetViewModel = SheetViewModel()
    @State var showingSheet: Bool = false
    @ObservedObject private var itemStore = ItemStore()
    
    var body: some View {
        NavigationView {
                ZStack {
                    BackgroundView()
                    List {
                        ForEach(itemStore.groupedItems().sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                            Section(header: Text(key)) {
                                ForEach(value) { item in
                                    NavigationLink(destination:
                                                    ZStack {
                                        BackgroundView()
                                        VStack(spacing: 50) {
                                            if let iconName = item.icon, let icon = IconViewModel.iconList.first(where: { $0.image == iconName }) {
                                                Image(icon.image)
                                                    .frame(maxWidth:.infinity)
                                            }
                                            Spacer()
                                            Text("Name: \(item.name)")
                                            Text("Email: \(item.email)")
                                            Text("Password: \(item.password)")
                                            Spacer()
                                        }
                                        .frame(maxWidth:.infinity,alignment:.leading)
                                        .padding(40)
                                    })
                                    {
                                        HStack {
                                            if let iconName = item.icon, let icon = IconViewModel.iconList.first(where: { $0.image == iconName }) {
                                                Image(icon.image)
                                            }
                                            VStack(alignment: .leading) {
                                                Text(item.name)
                                                    .font(.headline)
                                                Text(item.email)
                                                    .font(.subheadline)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                    }
                                    // Add a delete button to each row
                                    Button(action: {
                                        deleteItem(item: item)
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                    .frame(maxWidth:.infinity,alignment:.trailing)
                                }
                            }
                        }
                        .listRowBackground(Color(red: 0.56, green: 0.27, blue: 0.81).opacity(0.1))
                        
                    }
                    Button(action: {
                        showingSheet.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    })
                    .frame(width:350,height: 450,alignment:.bottomTrailing)
                    .sheet(isPresented: $showingSheet) {
                        Sheet(sheetViewModel: sheetViewModel,itemStore: itemStore, showingSheet: $showingSheet) {
                            itemStore.saveItems()
                        }
                        .background(Color(red: 0.56, green: 0.27, blue: 0.81).opacity(0.1))
                    }
                }
        }
        .navigationBarTitle("List")
    }
    // Function to delete the selected item
    private func deleteItem(item: Item) {
        if let index = itemStore.items.firstIndex(where: { $0.id == item.id }) {
            itemStore.items.remove(at: index)
            itemStore.saveItems()
        }
    }
}

#Preview {
    HomeView()
}
