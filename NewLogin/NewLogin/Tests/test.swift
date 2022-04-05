//
//  test.swift
//  NewLogin
//
//  Created by Тима Тихонов on 5.04.22.
//

import SwiftUI

struct test: View {
    var string: String = ""
    
    var body: some View {
        VStack {
            Text(string)
            let charset_n = CharacterSet(charactersIn: "123456789")
            let charset_l_low = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz")
            let charset_l_up = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let charset_s = CharacterSet(charactersIn: "!#$%&'()*+,-./:;<=>?@^_`|~")
            if string.rangeOfCharacter(from: charset_n) != nil {
                if string.rangeOfCharacter(from: charset_l_up) != nil {
                    if string.rangeOfCharacter(from: charset_l_low) != nil {
                        if string.rangeOfCharacter(from: charset_s) != nil {
                            Text("Good")
                        }
                    }
                }
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test(string: "Qwertyt124")
    }
}
