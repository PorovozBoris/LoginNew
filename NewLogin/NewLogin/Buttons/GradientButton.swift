//
//  GradientButton.swift
//  Login
//
//  Created by Тима Тихонов on 20.02.22.
//

import SwiftUI

struct GradientButton: View {
    var text: String = ""
    var Status: Bool = true
    
    var body: some View {
        Text(text)
            .font(.subheadline.bold())
            .frame(width: 122, height: 47, alignment: .center)
            .shadow(color: Color.black, radius: 1, x: 0.2, y: 0.2)
            .background(Status ? LinearGradient(gradient: Gradient(colors: [
                                            Color(red: 255/255, green: 119/255, blue: 46/255),
                                            Color(red: 255/255, green: 45/255, blue: 85/255)
                                                ]),
                                       startPoint: .topLeading,
                                                     endPoint: .bottomTrailing) :
                            LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .foregroundColor(Status ? .white : .gray.opacity(0.2))
            .mask(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .padding(.top, 10)
            .shadow(color: Color.black, radius: 0.5, x: 0.2, y: 0.2)
    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton(text: "Login", Status: false)
    }
}
