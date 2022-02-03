//
//  ContentView.swift
//  TVsmartT
//
//  Created by bnkwsr2 on 03.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var screen = "SplashScreen"
    @StateObject var mainModule = MainModule()
    var body: some View {
        if (screen == "SplashScreen") {
            SplashScreen(screen: $screen)
                .environmentObject(mainModule)
        } else if (screen == "TVMapScreen") {
            TVMapScreen(screen : $screen)
                .environmentObject(mainModule)
        }
        
    }
}



