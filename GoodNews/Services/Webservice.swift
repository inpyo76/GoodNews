//
//  Webservice.swift
//  GoodNews
//
//  Created by iphong on 23/07/2019.
//  Copyright © 2019 sowt. All rights reserved.
//

import Foundation
import Alamofire

class Webservice {
    
    func getArticles(urlString: String, completion: @escaping ([Article]?) -> ()) {
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { (response) in

                switch response.result {
                    case .success:
                        do {
                            //원하는 데이터를 추출하고, 데이터를 다시 인코딩한다.
                            ////////////////////////////////////////////////////
                            let rcvData = response.result.value as! NSDictionary
                            let encodeData = rcvData["articles"] as! [Any]
                            let jsonData = try JSONSerialization.data(withJSONObject:encodeData, options: .prettyPrinted)
                            let reqJSONStr = String(data: jsonData, encoding: .utf8)
                            let data = reqJSONStr?.data(using: .utf8)
                            ////////////////////////////////////////////////////

                            let articleArray:[Article] = try JSONDecoder().decode([Article].self, from: data!)
                            completion(articleArray)
                        }
                        catch {
                            completion(nil)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                        completion(nil)
                }
        }
    }
}
