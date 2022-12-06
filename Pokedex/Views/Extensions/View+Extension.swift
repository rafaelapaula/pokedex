//
//  View+Extension.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 06/12/22.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
