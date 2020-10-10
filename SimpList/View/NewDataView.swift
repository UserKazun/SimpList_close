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
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack {
                        HStack {
                            Text("\(homeData.updateItem == nil ? "Add New" : "Update") Task")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer(minLength: 0)
                        }
                        .padding()
                        
                        TextEditor(text: $homeData.content)
                            .padding()
                        
                        HStack {
                            DateButton(title: "Today", homeData: homeData)
                            DateButton(title: "Tomorrow", homeData: homeData)
                                        
                            // Date Picker
                            DatePicker("", selection: $homeData.date, displayedComponents: .date)
                                .labelsHidden()
                                .accentColor(Color.green)
                        }
                        .padding()
                    }
            .padding(.vertical, 40)
            // Add Button
                                    Button(action: {
                                            homeData.writeData(context: context)
                                        }, label: {
                                            Image(systemName: "plus")
                                                .font(.title2)
                                                .padding(20)
                                                .foregroundColor(.black)
                                        })
                                        .padding()
                                    
                                            
                                    // disabling button when no data
                                    .disabled(homeData.content == "" ? true: false)
                                    .opacity(homeData.content == "" ? 0.5 : 1)
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        
    }
}
