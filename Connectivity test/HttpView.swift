//
//  HttpView.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2023/2/3.
//

import SwiftUI

struct HttpView: View {
    var body: some View {
        List {
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
        }
        .listStyle(PlainListStyle())
    }
}

struct HttpView_Previews: PreviewProvider {
    static var previews: some View {
        HttpView()
    }
}
