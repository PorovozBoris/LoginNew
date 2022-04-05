//
//  FailedSignup.swift
//  NewLogin
//
//  Created by Тима Тихонов on 4.04.22.
//

import SwiftUI

struct FailedSignup: View {
    @Binding var uncorrectData: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Image(systemName: "exclamationmark.circle")
                        .resizable()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .foregroundColor(Color.gray.opacity(0.5))
                        .padding()
                    
                    Text("This Email is already registered, please use another one or use password recovery")
                        .foregroundColor(Color.gray.opacity(0.7))
                        .padding(.top)
                        .padding(.horizontal, 20)

                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            uncorrectData.toggle()
                        }
                    } label: {
                        Text("Back")
                            .foregroundColor(Color.gray.opacity(0.9))
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
        .background(Color.black.opacity(uncorrectData ? 0.3 : 0).blur(radius: 90))
        .ignoresSafeArea(.all)
    }
}

struct FailedSignuo_Previews: PreviewProvider {
    static var previews: some View {
        FailedSignup(uncorrectData: .constant(true))
    }
}
