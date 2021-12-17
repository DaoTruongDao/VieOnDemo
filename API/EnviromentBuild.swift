//
//  EnviromentBuild.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//

import UIKit

enum Environment: String {
    case production = "https://cets-api.bsjkk.co.jp"
    case noProduction = "https://uat-cets-api.bsjkk.co.jp" // https://ace-api.bostonscientific.asia
    case qa = "https://ace-api.bostonscientific.asia"
    case developer  = "https://dev-api-boston-japan.demoapp.info"
    case local = "http://10.0.101.79:8081"
}

class EnvironmentBuild: NSObject {
    static let shared = EnvironmentBuild()
    var environmen = Environment.developer.rawValue
}

