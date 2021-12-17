//
//  APIPortal+ExtensionsBase.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//

import UIKit
import Alamofire
import ObjectMapper

extension APIPortal {
    
    
    func requestApiWith(url: URL,
                        menthodApi: HTTPMethod = HTTPMethod.get,
                        parameters: [String: Any]? = nil,
                        encoding: ParameterEncoding = JSONEncoding.default,
                        header: HTTPHeaders?,
                        complete: @escaping (String) -> Void,
                        fail: @escaping () -> Void ) -> Request {
        print( "<=================New Request=======================>")
        print( "URL: " + url.absoluteString)
        print("Parameters: " + "\(String(describing: parameters))")
        
        let manager =  Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        let request = manager.request(url, method: menthodApi, parameters: parameters, encoding: encoding, headers: header)
        //
        request.responseString { (response) in
            
            if let sts = response.response?.statusCode {
                print( "<=================Response=======================>")
                print("Response status CODE: ", sts, " - URL", url)
                if sts == 200 {
                    
                    complete(response.value ?? "")
                    
                }else{
                    fail()
                }
            }
            
        }
        return request
    }
}
