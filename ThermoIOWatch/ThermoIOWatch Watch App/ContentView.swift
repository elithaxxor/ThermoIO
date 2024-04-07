//
//  ContentView.swift
//  ThermoIOWatch Watch App
//
//  Created by Adel Al-Aali on 4/7/24.
//

import SwiftUI

var T = ThermalMonitor()

struct ContentView: View {
    @State var thermalState = ""
    @State var date = Date.now
    @State var time = Date.timeIntervalSinceReferenceDate
    
    @StateObject var watchConnector = WatchDataReceiver() 

    
    func sendData() {
        print("[!] SENDING DATA TO WATCH")
        var state = T.checkThermalState()
        print([state: 0])
        
        watchConnector.sendWatchToIphone(info: [state: 0])

    }

    var body: some View {
        ZStack
        {
            Color(.blue)
                .edgesIgnoringSafeArea(.all)

        VStack {
//            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                
//                let state = T.checkThermalState()
//                
//                
//                Text(state) // set
//            })
            
            Button(action: {
                let state = T.checkThermalState()
                        sendData()
                    }) {
                        Text(T.checkThermalState())
                    }
            
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(watchConnector.parsedReturnData) ") // MAKE THIS CHANGE DEPENDING ON LOGIC
                .font(.caption)
                .padding()
            
        }
        }
        
        
    }
}

#Preview {
    ContentView()
}
