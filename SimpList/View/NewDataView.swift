//
//  NewDataView.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/07.
//

import SwiftUI

struct NewDataView: View {
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 0, style: .continuous)
                .fill(Color(UIColor.secondarySystemBackground))
            
            if homeData.content.isEmpty {
                Text("\(homeData.updateItem == nil ? "Add" : "Update") Task")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $homeData.content)
                .padding(50)
        }
            
        VStack {
            HStack {
                DateButton(title: "Today", homeData: homeData)
                DateButton(title: "Tomorrow", homeData: homeData)
                            
                // Date Picker
                DatePicker("", selection: $homeData.date, displayedComponents: .date)
                    .labelsHidden()
                    .accentColor(Color.green)
            }
            .padding()
                        
            // Add Button
            Button(action: {
                homeData.writeData(context: context)
            }, label: {
                Label(title: {
                    Text(homeData.updateItem == nil ? "Add Now" : "Update")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }, icon: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                })
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(
                    LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(8)
            })
            .padding()
                    
            // disabling button when no data
            .disabled(homeData.content == "" ? true: false)
            .opacity(homeData.content == "" ? 0.5 : 1)
        }
        .background(Color.black.opacity(0.06)
                        .ignoresSafeArea(.all, edges: .bottom))
    }
}
