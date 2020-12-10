//
//  api_manager.swift
//  FIPE_MVVM
//
//  Created by Aline Sena on 09/12/20.
//

import Foundation
import Alamofire

class Api_manager{
    var arrayBrand = [Brand]()
    func request(url: String, completion: @escaping (_ json: [String: Any]?, _ jsonArray: [[String: Any]]?, _ error: String?) -> Void) {
            
            AF.request(url).responseJSON { response in
                guard let jsonObj = response.value else {
                    completion(nil, nil, "")
                    return
                }
                
                if let json = jsonObj as? [String: Any] {
                    if let jsn = json["error"] as? [String:Any] {
                        completion(nil, nil, "")
                    } else {
                        completion(json, nil, nil)
                    }
                } else if let jsonArray = jsonObj as? [[String: Any]] {
                    completion(nil, jsonArray, nil)
                } else {
                    completion(nil, nil, "")
                }
                
            }
            completion(nil,nil, "")
        }
    
    func loadData(onComplete: @escaping (Bool) -> Void) {
            request(url: "https://parallelum.com.br/fipe/api/v1/carros/marcas") { (json, jsonArray, string) in
                if let jsonArray = jsonArray {
                    var brands = [Brand]()
                    for item in jsonArray {
                        brands.append(Brand(fromDictionary: item))
                    }
                    self.arrayBrand = brands
                    //self.arrayFiltered = brands
                    onComplete(true)
                    return
                }
                onComplete(false)
            }
        }
    
    
    
}
