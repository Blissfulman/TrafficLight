//
//  RoundLight.swift
//  TrafficLight
//
//  Created by User on 10.12.2020.
//

import SwiftUI

struct RoundLight: View {
    let color: UIColor
    var opacity: Double = 0.3
    
    var body: some View {
        Color(color)
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .opacity(opacity)
            .padding(8)

    }
}

struct RoundLight_Previews: PreviewProvider {
    static var previews: some View {
        RoundLight(color: .yellow)
    }
}
