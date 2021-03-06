//
//  GetItemDataService.swift
//  ios_ZIGZAG
//
//  Created by kyoungjin on 2021/06/10.
//

import Foundation
import Alamofire

struct GetItemDataService {
    
    
    static let shared = GetItemDataService()
    
    func getItemInfo(completion: @escaping(NetworkResult<Any>) -> Void) {
        let URL = "http://18.217.241.233:5000/api/main/item"
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(URL, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData {dataResponse in
            
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
            
                let networkResult = self.judgeStatus(by:statusCode, value)
                completion(networkResult)
            
            case .failure: completion(.pathErr)
            }
            
        }
        
    }


    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
            switch statusCode {
            case 200: return isValidData(data: data)
            case 400: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
        
            }
    }
            


    private func isValidData(data: Data) -> NetworkResult<Any>  {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(ItemDataServiceModel.self, from: data)
        else {return .pathErr}
        
        return .success(decodedData.data)
    
    }
    

}
