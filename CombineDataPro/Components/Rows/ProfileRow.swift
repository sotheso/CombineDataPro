//
//  ProfileRow.swift
//  CombineDataPro
//
//  Created by Sothesom on 13/11/1403.
//

import SwiftUI

struct ProfileRow: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16){
            
            profilePicture
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Sothesom")
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundStyle(.white)
                
                Text("tehran city")
                    .font(.footnote)
                    .foregroundColor(Color.white.opacity(0.7))
            }
            
            Spacer()
            
            glowIcon
        }
        .blurBacground()
    }
    
    var profilePicture: some View{
        ZStack{
            Image(systemName: "circle.fill")
                .resizable()
                .font(.system(size: 66))
                .angularGradientGlow(colors: [Color(#colorLiteral(red: 0.2274509804, green: 0.4, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.2156862745, green: 1, blue: 0.6235294118, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.9176470588, blue: 0.1960784314, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.2039215686, blue: 0.2745098039, alpha: 1))])
                .frame(width: 66, height: 66)
                .blur(radius: 10)
            
            VStack{
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 66, height: 66, alignment: .center)
                    .cornerRadius(50)
            }
            .overlay(Circle().stroke(Color.white, lineWidth: 1.0))
        }
        
    }
    
    var glowIcon: some View {
        ZStack{
            AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3960784314, green: 0.5254901961, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.2509803922, blue: 0.3137254902, alpha: 1)), Color(#colorLiteral(red: 0.4274509804, green: 1, blue: 0.7254901961, alpha: 1)), Color(#colorLiteral(red: 0.4274509804, green: 1, blue: 0.7254901961, alpha: 1))]), center: .center, startAngle: .init(degrees: -190), endAngle: .degrees(155))
                .blur(radius: 8)
                .shadow(radius: 30)
                .frame(width: 36, height: 36)
            
            Image(systemName: "square.stack.fill")
                .linerGradientBackground(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))])
                .frame(width: 36, height: 36)
                .background(Color(#colorLiteral(red: 0.1019607843, green: 0.07058823529, blue: 0.2431372549, alpha: 1)).opacity(0.8))
                .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.white.opacity(0.7), lineWidth: 1.0).blendMode(.overlay))

            

        }
    }
}

#Preview {
    ProfileRow()
}
