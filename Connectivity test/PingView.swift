//
//  PingView.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2023/2/3.
//

import SwiftUI

struct PingView: View {
    @State var showOutput = true
    @State var output = """
                        ttl = 4ms
                        ttl = 4ms
                        ttl = 4ms
                        ttl = 4ms
                        """
    
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
                                    Text("Server:baidu.com")
                                }
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
