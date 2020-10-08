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
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack {
                HStack {
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(results) { task in
                            VStack(alignment: .leading, spacing: 5, content: {
                                Text(task.content ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text(task.date ?? Date(), style: .date)
                                    .fontWeight(.bold)
                            })
                            .foregroundColor(.black)
                        }
                    }
                    .padding()
                })
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
