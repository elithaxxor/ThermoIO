//
//  Logic.swift
//  ThermoIO Watch App
//
//  Created by Adel Al-Aali on 4/7/24.
//

import Foundation

import UIKit

class ThermalMonitor : ObservableObject {
    
    // SETS AN OBSERVABLE STATE FOR ALL OTHERS TO SEE
   //  var temp = ""
    
    func checkThermalState() -> String {
        switch ProcessInfo.processInfo.thermalState {
        case .nominal:
      //      temp = "normal temps"
            return "normal temps"
        case .fair:
    //        temp = "fair, warmer"
            return "fair, but it's getting warmer."
        case .serious:
   //         temp = "serious - thottelling"
            return "serious - throttelling."
        case .critical:
    //        temp = "critcal - damage likely"
            return "critical - damage likely"
        @unknown default:
            return "unknown."
        }
    }
}

// Usage
//let thermalMonitor = ThermalMonitor()
//print(thermalMonitor.checkThermalState())
