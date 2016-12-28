//
//  NIFetchDataDelegate.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/7/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

@objc public  protocol NIFetchDataDelegate{
    @objc optional func niFetchDataResponseSuccess(responseData: Array<AnyObject>)
    @objc optional func niFetchErrorFromClient(errorMessage:NSError)
    @objc optional func niFetchDataResponseHTTPEroro(errorResponse:HTTPURLResponse)
}
