//
//  GradientIcon.swift
//  CombineDataPro
//
//  Created by Sothesom on 10/11/1403.
//

import SwiftUI

struct GradientIcon: View {
    var icon: String = "questionmark"

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(hex: "#9EADFF"),
            Color(hex: "#FF8FFA")
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        
        .mask(Image(systemName: icon).font(.system(size: 17)))
        
        .background(Color(hex: "#1A123E").opacity(0.8))
        
        .frame(width: 36, height: 36)
        
        .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
// بردرش
        .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(lineWidth: 1).foregroundColor(.white).blendMode(.overlay))
        
    }
}

#Preview {
    GradientIcon()
}




extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&int)
        let a, r, g, b: Double
        switch hexSanitized.count {
        case 6: // RGB (بدون آلفا)
            (a, r, g, b) = (1, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
        case 8: // ARGB (با آلفا)
            (a, r, g, b) = (Double((int >> 24) & 0xFF) / 255, Double((int >> 16) & 0xFF) / 255, Double((int >> 8) & 0xFF) / 255, Double(int & 0xFF) / 255)
        default:
            (a, r, g, b) = (1, 0, 0, 0)
        }
        self = Color(red: r, green: g, blue: b, opacity: a)
    }
}
