//
//  Animations.swift
//  Some
//
//  Created by Тима Тихонов on 17.02.22.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.7, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.5, dampingFraction: 0.9)
}
