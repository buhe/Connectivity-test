//
//  TcpView.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2023/2/3.
//

import SwiftUI
import SSHClient

struct TcpView: View {
    @State var showTcpOutput = false
    // nc -l 13370 < hi
    // nc 192.168.31.60 13370
    @State var tcpHost = "192.168.31.60"
    @State var tcpPort = "80"
    @State var isTcpRunning = false
    
    @State var showSSHOutput = false
    @State var output = ""
    
    @State var connection: SSHConnection? = nil
    
    fileprivate func connectSSH() {
        DispatchQueue.global(qos: .background).async {
            connection = SSHConnection(
                host: "192.168.31.16",
                port: 22,
                authentication: SSHAuthentication(
                    username: "pi",
                    method: .password(.init("aa11aa")),
                    hostKeyValidation: .acceptAll()
                )
            )
            
            connection!.start(withTimeout: 3.0) { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        output = "SSH connected."
                    }
                    // Handle connection
                case .failure:
                    DispatchQueue.main.async {
                        output = "SSH connect failed. \(result)"
                    }
                    // Handle failure
                }
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List {
                VStack{
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.red)
                            .opacity(0.3)
                        //                    .shadow(radius: 10)
                        HStack {
                            VStack(alignment: .leading){
                                Text("Pure TCP")
                                HStack {
                                    Text("Server:baidu.com")
                                }
                                .font(.caption)
                                Text("Port:1234")
                            }
                            .padding()
                            Spacer()
                            Button{
                                if isTcpRunning {
                                    isTcpRunning.toggle()
                                    showTcpOutput.toggle()
                                } else {
                                    DispatchQueue.global(qos: .background).async {
                                    let task =
                                               URLSession.shared.streamTask(withHostName: tcpHost, port: 13370)
                                    task.readData(ofMinLength: 16384, maxLength: 65536, timeout: 30.0) { (data, eof, error) in
                                        print("error is \(error)")
                                        guard let data = data else { return }
                                        print(String(data: data, encoding: .utf8)!)
                                        DispatchQueue.main.async {
                                            output = String(data: data, encoding: .utf8)!
                                            }
                                        }
                                        
                                        task.resume()
                                    }
                                    isTcpRunning.toggle()
                                    showTcpOutput.toggle()
                                }
                            }label: {
                                Text(isTcpRunning ? "Stop" : "Run")
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                        }
                    }
                    
                    if showTcpOutput {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.red)
                                .opacity(0.1)
                            VStack(alignment: .leading) {
            
                                Text(output)
                                    .font(.caption)
                                    .padding()
                            }
                        }
                        .padding(.top)
                    } else {
                        EmptyView()
                    }
                }
                .listRowSeparator(.hidden)
                
                VStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.red)
                            .opacity(0.3)
                        //                    .shadow(radius: 10)
                        HStack {
                            VStack(alignment: .leading){
                                HStack {
                                    Text("SSH")
                                    Text("pro")
                                        .fontWeight(.bold)
                                        .font(.caption)
                                }
                                HStack {
                                    Text("Server:192.168.31.16")
                                }
                                .font(.caption)
                                Text("Port:22")
                                    .font(.caption)
                            }
                            .padding()
                            Spacer()
                            Button{
                                connectSSH()
                                
                                showSSHOutput.toggle()
                            }label: {
                                Text("Run")
                            }
                            .buttonStyle(.borderedProminent)
                            .padding()
                        }
                    }
                    
                    if showSSHOutput {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.red)
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
                }.listRowSeparator(.hidden)
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

struct TcpView_Previews: PreviewProvider {
    static var previews: some View {
        TcpView()
    }
}
