//
//  PingView.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2023/2/3.
//

import SwiftUI
import SwiftyPing

struct PingView: View {
    @State var showOutput = false
    @State var output = ""
    @State var isRunning = false
    @State var pinger: SwiftyPing?
    @State var host = "baidu.com"
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.blue)
                            .opacity(0.3)
                            .frame(height: 88)
                        //                    .shadow(radius: 10)
                        HStack {
                            VStack(alignment: .leading){
                                Text("Ping")
                                HStack {
                                    Text("Server:")
                                    TextField("Host", text: $host)
                                }
                                .font(.caption)
                            }
                            .padding()
                            Spacer()
                            Button{
                                
                                if isRunning {
                                    pinger?.stopPinging()
                                    isRunning.toggle()
                                    showOutput.toggle()
                                    output = ""
                                } else {
                                    pinger = try? SwiftyPing(host: host, configuration: PingConfiguration(interval: 0.5, with: 0.5), queue: DispatchQueue.global())
                                    pinger?.observer = { (response) in
                                        let duration = response.duration * 1000
                                        let size = response.byteCount ?? 0
//                                        print(duration)
                                        DispatchQueue.main.async {
                                            if size == 0 {
                                                output = "Request timeout for seq=\(response.sequenceNumber)\n" + output
                                            } else {
                                                output = "\(size) bytes \(response.ipAddress ?? "") : seq=\(response.sequenceNumber)  time=\(doubleFormat(value: duration))ms \n" + output
                                            }
                                        }
                                    }
                                    try? pinger?.startPinging()
                                    isRunning.toggle()
                                    showOutput.toggle()
                                }
                                

                            }label: {
                                Text(isRunning ? "Stop" : "Run")
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                        }
                    }
//                    Toggle(isOn: $showOutput){
////                        Image(systemName: "eye")
//                    }
                    
                    if showOutput {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.blue)
                                .opacity(0.1)
                            VStack(alignment: .leading) {
            
                                Text(output)
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    } else {
                        EmptyView()
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .toolbar{
                NavigationLink{
                    SettingsView()
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

struct PingView_Previews: PreviewProvider {
    static var previews: some View {
        PingView()
    }
}
