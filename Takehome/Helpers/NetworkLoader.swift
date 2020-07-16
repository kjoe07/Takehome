//
//  NetworkLoader.swift
//  Takehome
//
//  Created by Yoel Jimenez del Valle on 7/16/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
import Foundation
protocol DataLoader {
    func loadData(url: String,params:[String:Any],method: MethodType,completion: @escaping (Result<Data, Error>) -> Void)
    func cancel()
}
class NetworkLoader: DataLoader{
    var task: URLSessionDataTask?
    func loadData(url: String, params: [String : Any], method: MethodType,completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: URL(string: "https://www.plugco.in/public/\(url)")!)
        print("the url is \(String(describing: request.url?.absoluteURL))")
        request.httpMethod = method.method
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue:  .main)
        task = session.dataTask(with: request){ data,response,error  in
            print("response \(String(describing: response)): \(String(describing: data))")
            if error != nil {
                completion(.failure(error!))
            }
            guard let data = data else { return }
                completion(.success(data))
        }
        task?.resume()
    }
    func cancel() {
        task?.cancel()
    }
}
enum MethodType {
    case post
    case get
    var method: String{
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
