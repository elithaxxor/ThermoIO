//
//  ContentView.swift
//  ThermoIOWatch
//
//  Created by Adel Al-Aali on 4/7/24.
//

import SwiftUI

var T = ThermalMonitor()

struct ContentView: View {
    @State var thermalState = ""
    @State var date = Date.now
    @State var time = Date.timeIntervalSinceReferenceDate
    
    @StateObject var T = ThermalMonitor() /// Try this if data flow doesnt work properly
    @StateObject var watchConnector = PhoneToWatchDataSender() // Inits watch data class

    func sendData() {
        print("[!] SENDING DATA TO WATCH")
        var state = T.checkThermalState()
        print([state: 0])
        watchConnector.sendIphoneToWatch(info: [state: 0])

    }
    var body: some View {
        ZStack
        {
            
           
//            Button(action: sendData, label: {
//                
//                let state = T.checkThermalState()
//                Text("state") // set
//                
//            })
//            
            
            Button(action: {
                let state = T.checkThermalState()
                        sendData()
                    }) {
                        Text(T.checkThermalState())
                    }
            
            
        VStack {
           
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
            Text("\(watchConnector.parsedReturnData00) ") // MAKE THIS CHANGE DEPENDING ON LOGIC
                .font(.caption)
                .padding()
            
        }
        }
        

    }
}

#Preview {
    ContentView()
}
