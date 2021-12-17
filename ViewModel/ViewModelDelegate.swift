//
//  ViewModelDelegate.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func startLoading()
    func stopLoading()
    func didCallAPISuccess(success: String?)
    func didCallAPIFailed(error: String)
}

extension ViewModelDelegate {
    func startLoading() {}
    func stopLoading() {}
    func didCallAPISuccess(success: String?) {}
    func didCallAPIFailed(error: String) {}
}

