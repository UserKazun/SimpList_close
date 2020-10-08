//
//  ContentView.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/03.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    init() {
        UITextView.appearance()
            .backgroundColor = .clear
    }
    
    var body: some View {
        Home()
    }
}
