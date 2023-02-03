//
//  HttpView.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2023/2/3.
//

import SwiftUI

struct HttpView: View {
    @State var showPureHttpOutput = true
    @State var showHttpServerOutput = true
    @State var showPureHttpsOutput = true
    @State var showHttpsCertOutput = true
    @State var showWebsocketOutput = true
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
                            .fill(.yellow)
                            .opacity(0.3)
                        //                    .shadow(radius: 10)
                        HStack {
                            VStack(alignment: .leading){
                                Text("Pure Http")
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
                    
                    if showPureHttpOutput {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.yellow)
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
                
                VStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.yellow)
                            .opacity(0.3)
                        //                    .shadow(radius: 10)
                        HStack {
                            VStack(alignment: .leading){
                                Text("Pure Https")
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
                    
                    if showPureHttpsOutput {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.yellow)
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
                
                VStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.yellow)
                            .opacity(0.3)
                        //                    .shadow(radius: 10)
                        HStack {
                            VStack(alignment: .leading){
                                HStack {
                                    Text("Websockt")
                                    Text("pro")
                                        .fontWeight(.bold)
                                        .font(.caption)
                                }
                                HStack {
                                    Text("Server:baidu.com")
                                }
                                .font(.caption)
                                Text("Port:23")
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
                    
                    if showWebsocketOutput {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.yellow)
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
                
                VStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.yellow)
                            .opacity(0.3)
                        //                    .shadow(radius: 10)
                        HStack {
                            VStack(alignment: .leading){
                                HStack {
                                    Text("Https with custom certificate")
                                    Text("pro")
                                        .fontWeight(.bold)
                                        .font(.caption)
                                }
                                HStack {
                                    Text("Server:baidu.com")
                                }
                                .font(.caption)
                                Text("Port:23")
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
                    
                    if showHttpsCertOutput {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.yellow)
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
                
                VStack {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.yellow)
                            .opacity(0.3)
                        //                    .shadow(radius: 10)
                        HStack {
                            VStack(alignment: .leading){
                                HStack {
                                    Text("Http Server")
                                    Text("pro")
                                        .fontWeight(.bold)
                                        .font(.caption)
                                }
                                HStack {
                                    Text("Server:baidu.com")
                                }
                                .font(.caption)
                                Text("Port:23")
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
                    
                    if showHttpServerOutput {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(.yellow)
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

struct HttpView_Previews: PreviewProvider {
    static var previews: some View {
        HttpView()
    }
}
