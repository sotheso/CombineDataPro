//
//  ContentView.swift
//  CombineDataPro
//
//  Created by Sothesom on 10/11/1403.
//

import SwiftUI

struct ContentView: View {
    @State private var contentOffset = CGFloat(0)
    
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                TrackableScrollView(offsetChanged: {
                    offset in
                    withAnimation(.easeIn) {
                        contentOffset = offset.y
                    }
                }) {
                    Text("Sothesom")
                        .padding()
                }
                
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
        }
        // For iPad 
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
