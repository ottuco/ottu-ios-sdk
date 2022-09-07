//
//  Servcies.swift
//  Example
//
//  Created by Maninder Singh on 04/09/22.
//

import Foundation

class Token: NSObject {

    static let shared = Token()
    
    private override init() {}
    
    
    func getToken(params:[String:Any],headers:[String:String],base_URL:String,completion: @escaping ((Bool,String?,String?) -> ())){
        guard let serviceUrl = URL(string: base_URL) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return
        }
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else{
                    completion(false,nil,error?.localizedDescription ?? "")
                    return
                }
                
                guard let responseExist = response as? HTTPURLResponse else{
                    completion(false,nil,"Status id not exist")
                    return
                }
                
                guard let dataExist = data else {
                    completion(false,nil,"Data not exist")
                    return
                }
                
                guard responseExist.statusCode <= 299 && responseExist.statusCode >= 200 else {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: dataExist, options: .mutableContainers)
                        completion(false,nil,"\(jsonObject)")
                    } catch let myJSONError {
                        completion(false,nil,"Eror while data parsing\n\(myJSONError.localizedDescription)")
                    }
                    return
                }
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: dataExist, options: .mutableContainers)
                    if let jsonDict = jsonObject as? [String: Any]{
                        let sessionId = jsonDict["session_id"] as? String ?? ""
                        completion(true,sessionId,nil)
                    }
                } catch let myJSONError {
                    completion(false,nil,"Eror while data parsing\n\(myJSONError.localizedDescription)")
                }
            }
        }.resume()
    }
    

}
