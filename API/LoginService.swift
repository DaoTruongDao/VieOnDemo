//
//  LoginService.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 23/12/2021.
//

import Foundation
import Alamofire
import ObjectMapper

protocol LoginDelegate: AnyObject{
    func loginData(data: LoginModel)
}


struct RequestBodyFormDataKeyValue {
        var sKey: String
        var sValue: String
    }
class LoginService{
    weak var delegate: LoginDelegate?
    static let shared = LoginService()
    func login(phone: String, pass: String) {
        var bodyKeyValue = [RequestBodyFormDataKeyValue]()
        bodyKeyValue.append(RequestBodyFormDataKeyValue(sKey: "phone_number", sValue: phone))
        bodyKeyValue.append(RequestBodyFormDataKeyValue(sKey: "password", sValue: pass))

        var sURL : String!
        sURL = "https://testing-api.vieon.vn/backend/user/login/mobile"
        let serializer = DataResponseSerializer(emptyRequestMethods: Set(minimumCapacity: 200))

        var sampleRequest = URLRequest(url: URL(string: sURL)!)
        sampleRequest.httpMethod = HTTPMethod.post.rawValue

        AF.upload(multipartFormData: { multipartFormData in
            for  formData in bodyKeyValue
            {
                multipartFormData.append(Data(formData.sValue.utf8), withName:  formData.sKey)
            }

        }, to: sURL,method: .post)
        .uploadProgress{progress in
            print(CGFloat(progress.fractionCompleted))
        }
        .response{response in
            if(response.error == nil){
                var reponseString : String!
                reponseString = ""
                if response.data != nil  {
                    reponseString = String(bytes: response.data!, encoding: .utf8)
                }
                else{
                    reponseString = response.response?.description
                }

                print(reponseString ?? "")
                let mode = LoginModel.init(JSONString: reponseString)
                self.delegate?.loginData(data: mode!)
                print(response.response?.statusCode)
                var reponseData : NSData!
                reponseData = response.data! as NSData
                var iDataLength = reponseData.length
                print("Size :\(iDataLength) bytes")

            }
        }
    }

}
    



