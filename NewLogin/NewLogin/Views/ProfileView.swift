//
//  ProfileView.swift
//  NewLogin
//
//  Created by Тима Тихонов on 31.03.22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @Binding var showProfileView: Bool
    @Binding var showToggleLogin: Bool
    
    var body: some View {
        VStack {
            NavigationBar(title: "parent",hasScrolled: .constant(false))
            
            Text("ProfileView")
                .font(.title.bold())
                .offset(y: -100)
            
            Button {
                withAnimation {
                    logoutUser()
                    showProfileView.toggle()
                    showToggleLogin.toggle()
                }
            } label: {
                Text("Sign out")
                    .font(.title.bold())
            }
            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    func logoutUser() {
        // call from any screen
        
        do { try Auth.auth().signOut() }
        catch { print("already logged out") }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showProfileView: .constant(false), showToggleLogin: .constant(false))
    }
}
