//
//  Home.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/03.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    // Fetching Data
    @FetchRequest(entity: Task.entity(), sortDescriptors:
                    [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results: FetchedResults<Task>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack(spacing: 0) {
                // Empty View
                if results.isEmpty {
                    Spacer()
                    
                    Text("No Tasks")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack(alignment: .leading, spacing: 20) {
                            Spacer(minLength: 230)
                            
                            if results.isEmpty {
                                Text("こんにちは")
                                    .foregroundColor(.black)
                            }
                            
                            ForEach(results) { task in
                                HStack(alignment: .center, spacing: 10, content: {
                                    Text(task.date ?? Date(), style: .time)
                                        .font(.system(size: 15))
                                        .fontWeight(.medium)
                                        .foregroundColor(.blue)
                                    
                                    Text(task.content ?? "")
                                        .font(.system(size: 15))
                                        .fontWeight(.regular)
                                })
                                .foregroundColor(.black)
                                .contextMenu {
                                    Button(action: {
                                        homeData.EditItem(item: task)
                                    }, label: {
                                        Text("Edit")
                                    })
                                    
                                    Button(action: {
                                        context.delete(task)
                                        try! context.save()
                                    }, label: {
                                        Text("Delete")
                                    })
                                }
                            }
                        }
                        .padding()
                    })
                }
            }
            // Add Button
            Button(action: {
                homeData.isNewData.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), center: .center)
                    )
                    .clipShape(Circle())
            })
            .padding()
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeData.isNewData, content: {
            NewDataView(homeData: homeData)
        })
    }
}

func getGreeting() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    
    // Time set
    let startMorningTime = ""
    let endMornignTime = ""
    let startEveningTime = ""
    let endEveningTime = ""
    let startNightTime = ""
    let endNightTime = ""
    
    var greeting = ""
    
    dateFormatter.dateFormat =  DateFormatter.dateFormat(fromTemplate: "HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))
    
    return greeting
}
