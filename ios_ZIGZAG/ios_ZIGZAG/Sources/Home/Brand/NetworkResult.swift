//
//  NetworkResult.swift
//  ios_ZIGZAG
//
//  Created by kyoungjin on 2021/06/09.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail 
}
