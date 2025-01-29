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
                    content
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
    
    
    var content: some View {
        VStack{
            
            // other content
            
// Table View FAQ...
            VStack{
                NavigationLink(destination: FAQView()) {
                    MenuRow()
                }
                divider
                
                NavigationLink(destination: PackageView()) {
                    MenuRow(title: "SwiftUI Packages",  leftIcon: "square.stack.3d.up.fill")
                }
                divider
                
                Link(destination: URL(string: "https://www.youtube.com/@supsothesom1574")!,
                     label: {
                    MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                })
            }
            .padding(16)
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark ))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color.white, lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.top, 20)
            
            Text("Version : 1.0.0")
                .font(.footnote)
                .opacity(0.7)
                .padding(.top ,20)
                .padding(.horizontal ,20)
                .padding(.bottom ,10)
        }
        .foregroundColor(.white)
        .padding(.top ,20)
        .padding(.horizontal ,20)
        .padding(.bottom ,10)
    }
    // خط بین موارد تیبل
    var divider: some View {
        Divider().background(Color.white.blendMode(.overlay))
    }

}

#Preview {
    ContentView()
}
