//
//  ContentView.swift
//  NewLogin
//
//  Created by Тима Тихонов on 30.03.22.
//

import SwiftUI
import CoreData
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = "Email"
    @State private var password: String = "Password"
    @State private var showToggleSignup: Bool = false
    @State private var showToggleLogin: Bool = false
    @State private var showToggleReset: Bool = false
    @State private var showProfileView: Bool = false
    @State private var badLogin: Bool = false
    @State private var opacity = 0.0

    
    var body: some View {
        VStack {
            VStack {
                if !showToggleLogin  {
                    VStack {
                        LoginText
                        
                        LoginForm
                        
                        Button {
                            if email != "Email" {
                                if password != "Password" {
                                    signup()
                                }
                            }
                        } label: {
                            if email != "Email" {
                                if password != "Password" {
                                    GradientButton(text: "Login", Status: true)
                                        .opacity(showToggleLogin ? 0 : 1)
                                } else {
                                    GradientButton(text: "Login", Status: false)
                                        .opacity(showToggleLogin ? 0 : 1)
                                }
                            } else {
                                GradientButton(text: "Login", Status: false)
                                    .opacity(showToggleLogin ? 0 : 1)
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onAppear {
                            Auth.auth().addStateDidChangeListener { auth , user in
                                if user != nil {
                                    withAnimation(.easeInOut(duration: 0.4)) {
                                        showProfileView.toggle()
                                        showToggleLogin.toggle()
                                    }
                                }
                            }
                        }
                        ForgotPassButton
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .blur(radius: badLogin ? 4 : 0)
                }
                if showToggleSignup {
                    SignupView(showProfile: $showProfileView, showToggleSignup: $showToggleSignup, showToggleLogin: $showToggleLogin)
                }
                
                if showToggleReset {
                    ResetView(showToggleReset: $showToggleReset, showToggleLogin: $showToggleLogin)
                }
                
                if showProfileView {
                    ProfileView(showProfileView: $showProfileView, showToggleLogin: $showToggleLogin)
                }
            }
            .padding(.horizontal, showToggleLogin ? 0 : 40)
            .overlay(FailedLogin(badLogin: $badLogin).transition(.scale).offset(y: badLogin ? 0 : 1000))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(SignupButton)
        .background(Color.white)
    }
    
    var LoginText: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .center) {
                Image("Emblem")
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .offset(y: -90)
            Text("Enter") 
                .font(.title.bold())
                .foregroundColor(.black)
                .padding(.bottom, 10)
            Text("word word")
                .font(.title.bold())
                .foregroundColor(Color(red: 255/255, green: 82/255, blue: 75/255))
            Text("word word")
                .font(.title.bold())
                .foregroundColor(Color(red: 255/255, green: 82/255, blue: 75/255))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var LoginForm: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(Color(red: 255/255, green: 119/255, blue: 46/255))
                TextField("Email", text: $email)
                    .foregroundColor(.gray.opacity(0.8))
                    .autocapitalization(.none)
                    .textContentType(.emailAddress)
            }
            .offset(y: 4)

            Spacer()
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary.opacity(0.2))
            Spacer()
            HStack {
                Image(systemName: "lock.fill")
                    .padding(.leading, 2)
                    .foregroundColor(Color(red: 255/255, green: 119/255, blue: 46/255))
                SecureField("Password", text: $password)
                    .foregroundColor(.gray.opacity(0.8))
                    .autocapitalization(.none)
                    .textContentType(.password)
            }
            .offset(y: -4)
            Spacer()
        }
        .padding(20)
        .frame( maxWidth: .infinity, maxHeight: 140, alignment: .leading)
        .background(Color(red: 255/255, green: 250/255, blue: 250/255))
        .cornerRadius(13)
        .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.2), radius: 16, x: 12, y: 12)
    }
    
    var ForgotPassButton: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.4)) {
                showToggleReset.toggle()
                showToggleLogin.toggle()
            }
        } label: {
            Text("Forgot password?")
                .foregroundColor(Color(red: 255/255, green: 59/255, blue: 78/255).opacity(0.58))
                .font(.subheadline.bold())
                .padding(.top, 5)
                .opacity(showToggleLogin ? 0 : 1)
                .offset(x: showToggleLogin ? 1000 : 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .offset(x: showToggleLogin ? -1000 : 0)
    }
    
    var SignupButton: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.5)) {
                showToggleSignup.toggle()
                showToggleLogin.toggle()
            }
        } label: {
            Text("Sign up")
                .foregroundColor(Color(red: 255/255, green: 59/255, blue: 78/255).opacity(0.58))
                .font(.subheadline.bold())
                .padding(.top, 5)
                .opacity(showToggleLogin ? 0 : 1)
        }
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .offset(y: showToggleLogin ? 1000 : 0)
    }
    
    func signup() {
        
        if showToggleSignup {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    withAnimation(.easeOut(duration: 0.3)) {
                        badLogin.toggle()
                    }
                    return
                }
                print("User signed up!")
            }
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    withAnimation(.easeOut(duration: 0.3)) {
                        badLogin.toggle()
                    }
                    return
                    
                }
                print("User is signed in!")
            }
        }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
