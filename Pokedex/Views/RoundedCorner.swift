//
//  RoundedCorner.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 06/12/22.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCorner_Previews: PreviewProvider {
    static var previews: some View {
        Text("Rounded")
            .padding(10)
            .background(.gray)
            .cornerRadius(15, corners: [.bottomLeft])
            .cornerRadius(25, corners: [.topRight])
    }
}
