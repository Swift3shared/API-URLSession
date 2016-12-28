//
//  CacheStorage.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/7/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

class CacheStorage{
    
    func clearCache(){
        URLCache.shared.removeAllCachedResponses()
    }
    
    func Do_Request() {
        //Create request with caching policy
        let url = URL(string: BOOK_URL)
        var request = URLRequest(url:  url!, cachePolicy: NSURLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60)
        request.httpMethod = "GET"
        request.setValue(HEDER, forHTTPHeaderField: AUTHERTICATION)
        
        let cacheResponse = URLCache.shared.cachedResponse(for: request)
        if cacheResponse == nil {
            print("\n\n ************ \n\nCache resouse is nil. So we need to go to server")
            //default configuration
            let config = URLSessionConfiguration.default
            
            //Enable url cache in session configuration and assign capacity
            config.urlCache = URLCache.shared
            config.urlCache = URLCache(memoryCapacity: 51200, diskCapacity: 10000, diskPath: "urlCache")
            //create session with configration
            let session = URLSession(configuration: config)
            
            //create data task to download data and having completion handler
            let task = session.dataTask(with: request, completionHandler: {
                data, response, error  in
                //below two lines will cache the data, request object as key
                print("Server is requesting")
                if data != nil && response != nil {
                    let cacheResponse = CachedURLResponse(response: response!, data: data!)
                    URLCache.shared.storeCachedResponse(cacheResponse, for: request as URLRequest)
                }
            })
            task.resume()
        } else {
            //if cache response is not nil then print
            print("We have cache in hand. so no need to go to server anymore")
            let string = NSString(data: cacheResponse!.data, encoding: String.Encoding.utf8.rawValue)
            print(string ?? "Cach is nil")
            
            
        }
    }
}
