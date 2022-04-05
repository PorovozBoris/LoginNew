//
//  GoodSignup.swift
//  NewLogin
//
//  Created by Тима Тихонов on 4.04.22.
//

import SwiftUI

struct GoodSignup: View {
    @Binding var goodSignup: Bool
    @Binding var showToggleSignup: Bool
    @Binding var showToggleLogin: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .foregroundColor(Color.green.opacity(0.5))
                        .padding()
                    
                    Text("A link to reset your password has been sent to your Email")
                        .foregroundColor(Color.gray.opacity(0.9))
                        .padding(.top)
                        .padding(.horizontal, 20)

                    Button {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            goodSignup.toggle()
                            showToggleLogin.toggle()
                            showToggleSignup.toggle()
                        }
                    } label: {
                        Text("Go to profile")
                            .foregroundColor(Color.green.opacity(0.9))
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .background(Color.white)
                            .cornerRadius(14)
                            .padding(.horizontal, 40)
                            .padding(.bottom, 20)
                            .padding(.top, 20)
                            .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.18), radius: 5, x: 7, y: 7)
                            .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.1), radius: 5, x: -1, y: -1)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(35)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(Color.black.opacity(goodSignup ? 0.3 : 0).blur(radius: 90))
        .ignoresSafeArea(.all)
    }
}

struct GoodSignup_Previews: PreviewProvider {
    static var previews: some View {
        GoodSignup(goodSignup: .constant(true), showToggleSignup: .constant(false), showToggleLogin: .constant(false))
    }
}
