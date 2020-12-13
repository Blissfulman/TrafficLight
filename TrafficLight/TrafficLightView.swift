//
//  TrafficLightView.swift
//  TrafficLight
//
//  Created by User on 10.12.2020.
//

import SwiftUI

struct TrafficLightView: View {
    
    enum TrafficLightState {
        case off, red, yellow, green
    }
    
    // MARK: - Properties
    @State private var isLightRed = false
    @State private var isLightYellow = false
    @State private var isLightGreen = false
    @State private var textButton = "START"
    
    @State private var currentLight: TrafficLightState = .off
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                RoundLight(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                RoundLight(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                RoundLight(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                Spacer()
                SwitchButton(textButton: textButton,
                             action: switchButtonPressed)
            }
            .padding()
        }
    }
    
    // MARK: - Private methods
    private func switchButtonPressed() {
        switch currentLight {
        case .off:
            textButton = "NEXT"
            currentLight = .red
        case .red:
            currentLight = .yellow
        case.yellow:
            currentLight = .green
        case .green:
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightView()
    }
}
