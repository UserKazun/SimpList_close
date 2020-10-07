//
//  NewDataView.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/07.
//

import SwiftUI

struct NewDataView: View {
    @ObservedObject var homeData: HomeViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New Task")
            }
        }
    }
}
