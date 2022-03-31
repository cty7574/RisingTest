//
//  SearchRequest.swift
//  RisingTest
//
//  Created by 맨태 on 2022/03/31.
//


import Alamofire

class SearchRequest{
    func getSearchItem(_ parameters: String){
        let url = "https://dev.sosocamp.shop/search?searchText=\(parameters)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
            .responseDecodable(of: SearchResponse.self) { response in
                
                switch response.result {
                
                case .success(let response):
                    print("DEBUG>> Search Items Response \(response) ")
                    //delegate.didSuccessGetRandomItems(response)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    debugPrint(error)
                    
                }
            }
    }
}
