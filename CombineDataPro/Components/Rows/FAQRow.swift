//
//  FAQRow.swift
//  CombineDataPro
//
//  Created by Sothesom on 13/11/1403.
//

import SwiftUI

struct FAQRow: View {
    var faq: FAQ
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(faq.question)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(faq.answer)
                .font(.subheadline)
                .opacity(0.7)
            
            Divider()
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    FAQRow(faq: faqData[0])
}
