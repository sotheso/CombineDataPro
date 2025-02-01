//
//  Extentions.swift
//  CombineDataPro
//
//  Created by Sothesom on 13/11/1403.
//

import SwiftUI

extension View {
    // ویوی دکمه "Contact Support"
    // برای دارک مود
    func angularGradientGlow(colors: [Color]) -> some View {
        self.overlay(AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .degrees(0.0)))
            .mask(self)
    }
    
    func linerGradientBackground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
