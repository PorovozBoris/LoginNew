//
//  ResetView.swift
//  Login
//
//  Created by Тима Тихонов on 21.02.22.
//

import SwiftUI
import FirebaseAuth

struct ResetView: View {
    @State private var email: String = "Email"
    @State private var failedReset: Bool = false
    @State private var goodReset: Bool = false
    @Binding var showToggleReset: Bool
    @Binding var showToggleLogin: Bool
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Reset password")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                            .padding(.leading, 2)
                            .foregroundColor(Color(red: 255/255, green: 119/255, blue: 46/255))
                        TextField("Email", text: $email)
                            .foregroundColor(.gray.opacity(0.8))
                            .autocapitalization(.none)
                            .textContentType(.name)
                        
                    
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(red: 255/255, green: 250/255, blue: 250/255))
                    .cornerRadius(13)
                    .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.18), radius: 16, x: 0, y: 12)
                        
                    VStack {
                        Text("Enter the email of your account, and we'll email you a link to reset your password")
                            .font(.subheadline)
                            .foregroundColor(Color(red: 255/255, green: 59/255, blue: 78/255).opacity(0.60))
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        ResetPassWithEmail()
                    } label: {
                        GradientButton(text: "Reset", Status: true)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .leading)
                .padding(.horizontal, 40)
                .blur(radius: goodReset ? 4 : 0)
                .blur(radius: failedReset ? 4 : 0)
                .overlay(BackLoginFromReset.padding(.horizontal, 40).offset(y: failedReset ? -1000 : 0).offset(y: goodReset ? -1000 : 0))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .leading)
            .background(Color.white)
            .overlay(FailedReset(failedReset: $failedReset).offset(y: failedReset ? 0 : 1000))
            .overlay(GoodReset(goodReset: $goodReset, showToggleReset: $showToggleReset, showToggleLogin: $showToggleLogin).offset(y: goodReset ? 0 : 1000))
            
        }
    }
    
    var BackLoginFromReset: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.4)) {
                showToggleReset.toggle()
                showToggleLogin.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(Color.gray)
                .padding(8)
                .background(Color.white, in: Rectangle())
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .opacity(showToggleReset ? 1 : 0)
        }
        .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.18), radius: 16, x: 0, y: 12)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.top, 16)
        .ignoresSafeArea()
        .offset(y: 1)
    }
    
    func ResetPassWithEmail() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard error == nil else {
                print(error!.localizedDescription)
                withAnimation(.easeOut(duration: 0.3)) {
                    failedReset.toggle()
                }
                return
            }
            withAnimation(.easeInOut(duration: 0.3)) { goodReset.toggle() }
        }
    }
}

struct ResetView_Previews: PreviewProvider {
    static var previews: some View {
        ResetView(showToggleReset: .constant(true), showToggleLogin: .constant(true))
    }
}
