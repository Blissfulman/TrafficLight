//
//  SwitchButton.swift
//  TrafficLight
//
//  Created by User on 10.12.2020.
//

import SwiftUI

struct SwitchButton: View {
    let textButton: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(textButton)
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 70)
        .background(Color(.blue))
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4))
    }
}


struct SwitchButton_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButton(textButton: "START", action: {})
    }
}
