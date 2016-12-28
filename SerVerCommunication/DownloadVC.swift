//
//  DownloadVC.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/6/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

/*
import UIKit

class DownloadVC: UIViewController, URLSessionDownloadDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        //progressBar.setProgress(0.0, animated: true)  //set progressBar to 0 at
        //start    
    }
    
    var taskProgress = [NSURL: (written: Int64, expected: Int64)]()
    
    //@IBOutlet weak var progressBar: UIProgressView!
    //@IBOutlet weak var progressCount: UILabel!
    
    var images = [String]()
    
    var task : URLSessionTask!
    
    var pics = ["http://pillar.foundationu.com/wp-content/uploads/2016/03/banner.jpg", "http://pillar.foundationu.com/wp-content/uploads/2016/03/Abad-Edmerl.jpg", "http://pillar.foundationu.com/wp-content/uploads/2016/03/Abellana-Deniz-Dawn-1.jpg", "http://pillar.foundationu.com/wp-content/uploads/2016/03/Abequibel-Arneth.jpg", "http://pillar.foundationu.com/wp-content/uploads/2016/03/Abilla-Harriette.jpg", "http://pillar.foundationu.com/wp-content/uploads/2016/03/Pasko-Maria-Katrina.jpg", "http://pillar.foundationu.com/wp-content/uploads/2016/03/Pastias-Grace.jpg"]
    
    var counter:Float = 0.0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
    //        progressBar.setProgress(fractionalProgress, animated: animated)
     //       progressCount.text = ("\(counter)%")
        }
        //The didSet is called immediately after the new value is stored. The fractionalProgress constant keeps track of the progress.
    }
    
    var session : URLSession = {
        let config = URLSessionConfiguration.ephemeral
        config.allowsCellularAccess = false
        let session = URLSession( delegateQueue: OperationQueue.main)
        return session
    }()
    
    
    func doElaborateHTTP (sender:AnyObject!) {
        
  //      progressCount.text = "0%"
        if self.task != nil {
            return
        }
        
        
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0).asyn(execute: {
            
            let taskID = self.beginBackgroundUpdateTask()
            
            let file = FileHelperClass()
            
            var url = NSURL!()
            var req = NSMutableURLRequest()
            
            var task: NSURLSessionDownloadTask!
            
            for s in file.parseJsonFromFile() /* fund returning images url */ {
                let url = NSURL(string: s)
                req = NSMutableURLRequest(URL:url!)
                task = self.session.downloadTaskWithRequest(req)
                self.task = task
                task.resume()
                
            }
            
            // Do something with the result
            
            self.endBackgroundUpdateTask(taskID)
            
        })
        
    }
    
    func beginBackgroundUpdateTask() -> UIBackgroundTaskIdentifier {
        return UIApplication.shared.beginBackgroundTask(expirationHandler: {})
    }
    
    func endBackgroundUpdateTask(taskID: UIBackgroundTaskIdentifier) {
        UIApplication.shared.endBackgroundTask(taskID)
    }
    
    func URLSession(session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten writ: Int64, totalBytesExpectedToWrite exp: Int64) {
        
        DispatchQueue.main.async {
            self.taskProgress[downloadTask.originalRequest!.url!] = (writ, exp)
            
            // Update your views, you may separate it into a different function
            let totalWritten = self.taskProgress.reduce(0) { $0 + $1.1.written }
            let totalExpected = self.taskProgress.reduce(0) { $0 + $1.1.expected }
            let progress = Float(totalWritten) / Float(totalExpected)
            
            self.progressBar.setProgress(progress, animated: true)
            self.progressCount.text = "\(progress * 100)%"
        }
    }
    
    
    func URLSession(session: URLSession, downloadTask:
        URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64,
                                  expectedTotalBytes: Int64) {
        // unused in this example
    }
    
    func URLSession(session: URLSession, task: URLSessionTask, 
                    didCompleteWithError error: NSError?) {
        //        print("completed: error: \(error)")
    }
    
    // this is the only required NSURLSessionDownloadDelegate method
    
    func URLSession(session: URLSession, downloadTask: 
        URLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        //        print(downloadTask.response!.suggestedFilename!)
        images.append(downloadTask.response!.suggestedFilename!)
        print("\n \(images)")
    }
}
*/
