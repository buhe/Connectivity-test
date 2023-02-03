//
//  ContentView.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2022/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PingView()
                .tabItem {
                    VStack {
                        Image(systemName: "display.and.arrow.down")
                        Text("Ping")
                    }
                }
            TcpView()
                .tabItem {
                    VStack {
                        Image(systemName: "airport.extreme")
                        Text("TCP")
                    }
                }
            HttpView()
                .tabItem {
                    VStack {
                        Image(systemName: "network")
                        Text("Http")
                    }
                }
            OtherView()
                .tabItem {
                    VStack {
                        Image(systemName: "iphone.homebutton.radiowaves.left.and.right")
                        Text("Other")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
