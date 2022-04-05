//
//  Buttons.swift
//  NewLogin
//
//  Created by Тима Тихонов on 3.04.22.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack {
            Text("Button")
                .font(.title3.bold())
                .frame(width: 122, height: 47, alignment: .center)
                .background(
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [
                                       Color(red: 255/255, green: 119/255, blue: 46/255),
                                       Color(red: 255/255, green: 45/255, blue: 85/255)
                                    ]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(Color(red: 255/255, green: 119/255, blue: 46/255))
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(), radius: 20, x: 20, y: 20)
                .shadow(color: Color(), radius: 20, x: -20, y: -20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
