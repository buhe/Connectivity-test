//
//  OtherView.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2023/2/3.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        NavigationStack {
            List {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(.green)
                        .opacity(0.3)
                    //                    .shadow(radius: 10)
                    HStack {
                        VStack(alignment: .leading){
                            HStack {
                                Text("Bluetooth")
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

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
