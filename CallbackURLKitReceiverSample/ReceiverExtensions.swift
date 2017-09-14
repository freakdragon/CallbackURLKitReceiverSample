//
//  CallbackURLKitFunctions.swift
//  InteractiveReceiverTest
//
//  Created by Admin on 11.07.17.
//  Copyright © 2017 LAN-Optic, LLC. All rights reserved.
//

import Foundation
import UIKit

enum AnyError: FailureCallbackError {
    case noSendTextAction
    case buttonFailureError
    var code: Int {
        switch self {
        case .noSendTextAction: return 1
        case .buttonFailureError: return 2
        }
    }
    var message: String {
        switch self {
        case .noSendTextAction: return "There is no send text action"
        case .buttonFailureError: return "Button failure callback was pressed"
        }
    }
    
}

extension String {
    public func getAction() -> String? {
        let scheme_host_action__params = self.components(separatedBy: "?")
        if(scheme_host_action__params.count > 1) {
            let scheme__host_action = scheme_host_action__params[0].components(separatedBy: "://")
            if(scheme__host_action.count > 1) {
                let host__action = scheme__host_action[1].components(separatedBy: "/")
                if(host__action.count > 1) {
                    return host__action[1]
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}

extension Manager {
// [scheme]://[host]/[action]?[x-callback parameters]&[action parameters]
    public static func getCurAction() -> String? {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            return delegate.curAction
        }
        return nil
    }
    
    public static func getCurUrl() -> URL? {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            return delegate.curUrl
        } else {
            return nil
        }
    }
    
    public static func getParametersDictionary() -> Dictionary<String, String> {
            return getParametersDictionary(curURL: getCurUrl())
    }
    
    public static func getParametersDictionary(curURL: URL?) ->  Dictionary<String, String> {
        if(curURL != nil) {
            return curURL!.query?.toQueryDictionary ?? [:]
        } else {
            return [:]
        }
    }
    
    public static func executeSuccessCallback(returnParams: Dictionary<String, String>) {
        let parameters = self.getParametersDictionary()        
        self.shared.openCallback(parameters, type: .success) { comp in
            comp &= returnParams.queryString
        }
    }
    
    public static func executeFailureCallback(error: FailureCallbackError) {
        let parameters = self.getParametersDictionary()
        self.shared.openCallback(parameters, type: .error) { comp in
            comp &= error.XCUErrorQuery
        }
    }
    
    public static func executeCancelCallback() {
        let parameters = self.getParametersDictionary()
        self.shared.openCallback(parameters, type: .cancel)
    }

}


