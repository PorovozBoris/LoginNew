//
//  NavigationBar.swift
//  NewLogin
//
//  Created by Тима Тихонов on 1.04.22.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var hasScrolled: Bool
    @State private var showMenu: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.rectangle")
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                        
                }
                .frame(maxWidth: 36, maxHeight: 36, alignment: .center)
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.18), radius: 10, x: 10, y: 10)
                
                Text(title)
                    .bold()
                    .font(.system(size: 24))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "pencil")
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                        
                }
                .frame(maxWidth: 36, maxHeight: 36, alignment: .center)
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color(red: 94/255, green: 99/255, blue: 107/255).opacity(0.18), radius: 10, x: 10, y: 10)
                
                
            }
            .padding(.horizontal, 20)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "parent",hasScrolled: .constant(false))
    }
}
