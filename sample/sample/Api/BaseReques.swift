//
//  BaseReques.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit
import APIKit

protocol QiitaRequest: Request {
    
}

extension QiitaRequest {
    
    var baseURL: URL {
        return URL(string: "https://qiita.com")!
    }
    
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard (200..<300).contains(urlResponse.statusCode) else {
            throw SampleError(object: object, code:urlResponse.statusCode)
        }
        
        return object
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try response(from: object, urlResponse: urlResponse)
     }
    

}


struct SampleError: Error {
    let statusCode:Int
    let type:String
    let message:String
    
    init(object: Any, code:Int) {
        let dictionary = object as? [String: Any]
        self.statusCode = code
        self.type = dictionary!["type"] as? String ?? ""
        self.message = dictionary!["message"] as? String ?? ""
    
    }
}
