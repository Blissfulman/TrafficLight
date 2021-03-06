//
//  RoundLight.swift
//  TrafficLight
//
//  Created by User on 10.12.2020.
//

import SwiftUI

struct RoundLight: View {
    
    // MARK: - Properties
    let color: UIColor
    let opacity: Double
    
    var body: some View {
        Color(color)
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct RoundLight_Previews: PreviewProvider {
    static var previews: some View {
        RoundLight(color: .green, opacity: 1)
    }
}
