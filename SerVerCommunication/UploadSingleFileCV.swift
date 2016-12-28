//
//  UploadSingleFiel.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/7/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import UIKit

class UploadSingleFileCV:UIViewController, NIFetchDataDelegate {
    
    var delegate:UploadSingleFile = UploadSingleFile()
    var cachStorage:CacheStorage = CacheStorage()
    
    @IBOutlet weak var bookImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate.delegate = self
    }
    @IBAction func testNSCachePressed(_ sender: Any) {
        self.cachStorage.Do_Request()
    }
 
    @IBAction func uploadPress(_ sender: Any) {
        delegate.UploadRequest(image: bookImageView)
    }
    
    @IBAction func downloadPressed(_ sender: Any) {
        delegate.download_request(image: self.bookImageView)
    }
    
    func niFetchDataResponseHTTPEroro(errorResponse: HTTPURLResponse) {
        print("Server error code \(errorResponse.statusCode)")
        print("Server error \(errorResponse)")
    }
    
    @IBAction func clearCachePressed(_ sender: Any) {
        self.cachStorage.clearCache()
    }
    func niFetchErrorFromClient(errorMessage: NSError) {
        print("Error : \(errorMessage)")
    }
    
    private func niFetchDataResponseSuccess(responseData: [String : AnyObject]) {
        print("Success \(responseData)")
    }
}
