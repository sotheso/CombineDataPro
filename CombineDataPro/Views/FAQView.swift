//
//  FAQView.swift
//  CombineDataPro
//
//  Created by Sothesom on 10/11/1403.
//

import SwiftUI

struct FAQView: View {
    @State private var contentOffset = CGFloat(0)

    var body: some View {
        ZStack(alignment: .top){
            TrackableScrollView(offsetChanged: { offsetPoint in
                contentOffset = offsetPoint.y
            }) {
                
                content

            }
            VisualEffectBlur(blurStyle: .systemMaterial)
                .opacity(contentOffset < -16 ? 1 : 0)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Sothesom Package")
        .background(Color("Background 2").edgesIgnoringSafeArea(.all))
    }
    
    var content: some View{
        VStack(alignment: .leading, spacing: 16){
            ForEach(faqData, id: \.id) { f in
                FAQRow(faq: f)
            }
            
            Text("Have any questins?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .opacity(0.7)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    FAQView()
}
