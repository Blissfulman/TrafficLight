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
    @State private var redLight = RoundLight(color: .red)
    @State private var yellowLight = RoundLight(color: .yellow)
    @State private var greenLight = RoundLight(color: .green)
    @State private var textButton = "START"
    
    @State private var trafficLightState: TrafficLightState = .off {
        didSet {
            switch oldValue {
            case .off:
                textButton = "NEXT"
                redLight.on()
            case .red:
                redLight.off()
                yellowLight.on()
            case.yellow:
                yellowLight.off()
                greenLight.on()
            case .green:
                greenLight.off()
                redLight.on()
            }
        }
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
    
    // MARK: - Private methods
    private func switchButtonPressed() {
        switch trafficLightState {
        case .off:
            trafficLightState = .red
        case .red:
            trafficLightState = .yellow
        case.yellow:
            trafficLightState = .green
        case .green:
            trafficLightState = .red
        }
    }
    
    private func switchOn(_ light: inout RoundLight) {
        light.opacity = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightView()
    }
}
