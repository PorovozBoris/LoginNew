//
//  SignupView.swift
//  NewLogin
//
//  Created by Тима Тихонов on 30.03.22.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var email: String = "Email"
    @State private var password: String = "Password"
    @State private var firstName: String = "Name"
    @State private var secondName: String = "Surname"
    @State private var uncorrectData: Bool = false
    @State private var goodSignup: Bool = false
    @State private var uncorrectEmail: Bool = false
    @Binding var showProfile: Bool
    @Binding var showToggleSignup: Bool
    @Binding var showToggleLogin: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("Sign up")
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                SignupForm
                
                Text("Use 8 or more characters with a mix of letters, numbers & sumbols")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 255/255, green: 59/255, blue: 78/255).opacity(0.60))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    signup()
                } label: {
                    GradientButton(text: "Sign up", Status: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 40)
            .blur(radius: uncorrectData ? 4 : 0)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .overlay(BackLoginFromSignup.padding(.horizontal, 40).offset(y: uncorrectData ? -1000 : goodSignup ? -1000 : 0))
        .overlay(FailedSignup(uncorrectData: $uncorrectData).offset(y: uncorrectData ? 0 : 1000))
        .overlay(GoodSignup(goodSignup: $goodSignup, showToggleSignup: $showToggleSignup, showToggleLogin: $showToggleLogin).offset(y: goodSignup ? 0 : 1000))
    }
    
    var SignupForm: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(Color(red: 255/255, green: 119/255, blue: 46/255))
                    .padding(.trailing, 5)
                TextField("Name", text: $firstName)
                    .foregroundColor(.gray.opacity(0.8))
                    .autocapitalization(.none)
                    .textContentType(.givenName)
            }
            .padding(.vertical, 6)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary.opacity(0.2))
            
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(Color(red: 255/255, green: 119/255, blue: 46/255))
                    .padding(.trailing, 5)
                TextField("Surname", text: $secondName)
                    .foregroundColor(.gray.opacity(0.8))
                    .autocapitalization(.none)
                    .textContentType(.familyName)
            }
            .padding(.vertical, 6)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary.opacity(0.2))
            
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(Color(red: 255/255, green: 119/255, blue: 46/255))
                    .padding(.trailing, 3)
                TextField("Email", text: $email)
                    .foregroundColor(.gray.opacity(0.8))
                    .autocapitalization(.none)
                    .textContentType(.emailAddress)
                if uncorrectEmail {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(Color.red.opacity(0.6))
                }
            }
            .offset(x: -2)
            .padding(.vertical, 6)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary.opacity(0.2))
            
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(Color(red: 255/255, green: 119/255, blue: 46/255))
                    .padding(.trailing, 5)
                SecureField("Password", text: $password)
                    .foregroundColor(.gray.opacity(0.8))
                    .autocapitalization(.none)
                    .textContentType(.password)
            }
            .padding(.vertical, 6)
        }
        .padding(20)
        .frame( maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 255/255, green: 250/255, blue: 250/255))
        .cornerRadius(13)
        .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.18), radius: 16, x: 0, y: 12)
    }
    
    var BackLoginFromSignup: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.4)) {
                showToggleSignup.toggle()
                showToggleLogin.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(Color.gray)
                .padding(8)
                .background(Color.white, in: Rectangle())
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
        .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.18), radius: 16, x: 0, y: 12)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.top, 16)
        .ignoresSafeArea()
        .offset(y: 1)
    }
    
    func signup() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print(error!.localizedDescription)
                withAnimation(.easeOut(duration: 0.3)) {
                    uncorrectData.toggle()
                    if !uncorrectEmail {
                        uncorrectEmail.toggle()
                    }
                }
                return
            }
            print("User signed up!")
            goodSignup.toggle()
            uncorrectEmail.toggle()
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(showProfile: .constant(false),showToggleSignup: .constant(true), showToggleLogin: .constant(true))
    }
}
