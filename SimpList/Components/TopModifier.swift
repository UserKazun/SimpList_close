//
//  TopModifier.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/18.
//

import SwiftUI

struct TopModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.background(Color("AccentColor"))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: -9, y: -9)
            .shadow(color: Color.white.opacity(0.5), radius: 6, x: 9, y: 9)
    }
}
