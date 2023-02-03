//
//  PingView.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2023/2/3.
//

import SwiftUI

struct PingView: View {
    var body: some View {
        List {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(.blue)
                    .opacity(0.3)
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
        }
        .listStyle(PlainListStyle())
    }
}

struct PingView_Previews: PreviewProvider {
    static var previews: some View {
        PingView()
    }
}
