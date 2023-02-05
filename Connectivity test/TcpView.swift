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
    @State var showSSHOutput = false
    @State var output = ""
    
    var body: some View {
        NavigationStack{
            List {
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
                                .font(.caption)
                        }
                        .padding()
                        Spacer()
                        Button{
                            
                        }label: {
                            Text("Run")
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
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
                                DispatchQueue.global(qos: .background).async {
                                    let connection = SSHConnection(
                                        host: "192.168.31.16",
                                        port: 22,
                                        authentication: SSHAuthentication(
                                            username: "pi",
                                            method: .password(.init("aa11aa")),
                                            hostKeyValidation: .acceptAll()
                                        )
                                    )
                                    
                                    connection.start(withTimeout: 3.0) { result in
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
