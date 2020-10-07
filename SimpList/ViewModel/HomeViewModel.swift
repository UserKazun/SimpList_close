//
//  HomeViewModel.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/07.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    
    @Published var isNewData = false
    
}
