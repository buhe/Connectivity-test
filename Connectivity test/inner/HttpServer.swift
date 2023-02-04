//
//  HttpServer.swift
//  Connectivity test
//
//  Created by 顾艳华 on 2023/2/3.
//

import Foundation

struct HttpServerContorl {
    
    fileprivate func workaroundChinaSpecialBug() {
        let url = URL(string: "https://www.baidu.com")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let _ = data else { return }
//            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    
    init() {
        workaroundChinaSpecialBug()
    }
}
