//
//  PackageRow.swift
//  CombineDataPro
//
//  Created by Sothesom on 10/11/1403.
//

import SwiftUI

struct PackageRow: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var package: Package

    
    var body: some View {
        VStack(alignment: .leading) {
            Link(destination: URL(string: package.link)!, label: {
                LinearGradient(gradient: Gradient(colors:
                    colorScheme == .dark ? [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))] : [Color(#colorLiteral(red: 0.2235294118, green: 0.07450980392, blue: 0.7215686275, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 20)
                .mask(Text(package.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .frame(maxWidth: .infinity, alignment: .leading)
                      
                )
            })
            
            Divider()
        }
    }
}

#Preview {
    PackageRow(package: packagesData[0])
        .environment(\.colorScheme, .dark)
}
