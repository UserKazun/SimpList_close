//
//  Home.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/03.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        Button(action: {
            homeData.isNewData.toggle()
        }, label: {
            Text("Button")
        })
        .sheet(isPresented: $homeData.isNewData, content: {
            NewDataView(homeData: homeData)
        })
    }
}
