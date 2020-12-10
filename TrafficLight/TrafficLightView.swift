//
//  TrafficLightView.swift
//  TrafficLight
//
//  Created by User on 10.12.2020.
//

import SwiftUI

struct TrafficLightView: View {
    @State private var redLight = RoundLight(color: .red)
    @State private var yellowLight = RoundLight(color: .yellow)
    @State private var greenLight = RoundLight(color: .green)
    @State private var textButton = "START"
    
    @State private var trafficLightState: TrafficLightState = .off
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    enum TrafficLightState {
        case off, red, yellow, green
    }
    
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                redLight
                yellowLight
                greenLight
                Spacer()
                SwitchButton(textButton: textButton, action: switchButtonPressed)
            }
            .padding(50)
        }
        .ignoresSafeArea()
    }
    
    func switchButtonPressed() {
        switch trafficLightState {
        case .off:
            textButton = "NEXT"
            redLight.opacity = lightIsOn
            trafficLightState = .red
        case .red:
            redLight.opacity = lightIsOff
            yellowLight.opacity = lightIsOn
            trafficLightState = .yellow
        case.yellow:
            yellowLight.opacity = lightIsOff
            greenLight.opacity = lightIsOn
            trafficLightState = .green
        case .green:
            greenLight.opacity = lightIsOff
            redLight.opacity = lightIsOn
            trafficLightState = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightView()
    }
}
