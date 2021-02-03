//
//  AlamofireHelper.swift
//  PHDCTT
//
//  Created by liupenghui on 2021/2/3.
//

import Foundation

import Alamofire

class AlamofireHelper: NSObject {
    let base_url = BASE_URL
    static let `default` = AlamofireHelper()
    
    
    public func request(url withUrl:String,
                        method: HTTPMethod = .post,
                        parameters:[String:Any]? = nil,
                        ecoding: ParameterEncoding = URLEncoding.default,
                        successHandle:(([String:Any]) -> Void)? = nil,
                        failureHandle:((Error?) -> Void)? = nil)
                        {
        guard withUrl.lengthOfBytes(using: String.Encoding.utf8) > 0 else {return}
        var header:HTTPHeaders = [:]
        var _pars:[String:Any] = parameters ?? [:]
        
        if let token = User.token() {
            header["Authorization"] = token; _pars["t"] = token
            if User.isLogined() {
                _pars["uid"] = User.uid()!
            }
        }
        AF.request(base_url + withUrl, method: method, parameters: _pars, encoding:ecoding, headers: header)
            .validate()
            .responseJSON { (dataResponse) in
                DispatchQueue.main.async {
                    switch dataResponse.result {
                        case .success(let value):
                            if let dic = value as? [String:Any] ,let status = dic["status"] as? Int {
                                if "\(status)" == "200" {
                                    if let success = successHandle {
                                        success(dic);
                                    }
                                }else{
                                    if let failure = failureHandle {
                                        let err = NSError.init(domain: "\(dic["msg"] ?? "")", code:status, userInfo: nil)
                                        failure(err)
                                    }
                                }
                            }
                            break
                        
                        case .failure(let error):
                            if let failure = failureHandle {
                                failure(error)
                            }
                            break
                    }
                }
        }
        
        
    }
    
    //MARK:- Public Methods
   static public func get(url:String ,
             parameters:[String:Any]? = nil,
             successHandler:(([String:Any]) -> Void)? = nil,
             failureHandler:((Error?) -> Void)? = nil)
    {
    
    AlamofireHelper.default.request(url: url, method: .get, parameters: parameters, successHandle: successHandler, failureHandle: failureHandler)
    }
    
   static public func post(url:String ,
              parameters:[String:Any]? = nil,
              successHandler:(([String:Any]) -> Void)? = nil,
              failureHandler:((Error?) -> Void)? = nil)
    {
    AlamofireHelper.default.request(url: url, method: .post, parameters: parameters, successHandle: successHandler, failureHandle: failureHandler)

    }
    
}
