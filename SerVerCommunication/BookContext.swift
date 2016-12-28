//
//  ResturantContext.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/6/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

//let dataVal = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: nil)
//let dataVal = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: nil)

import Foundation

public class BookContext:NIFetchDataDelegate{
    
    var delegate:NIFetchDataDelegate!
    
    func fetchBooks(){
        var books:[Book] = []
        var request: URLRequest = URLRequest(url: URL(string: BOOK_URL)!)
        request.addValue(HEDER, forHTTPHeaderField: AUTHERTICATION)
        //request.allHTTPHeaderFields = ["Key":"Value"]
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with : request){
            data, response, error in
            guard let data = data, error == nil else {
                if let error = error as? NSError{
                    self.delegate?.niFetchErrorFromClient!(errorMessage : error)
                }
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // check for http errors
                self.delegate?.niFetchDataResponseHTTPEroro!(errorResponse: httpStatus)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,AnyObject>
                let jsonData = json["DATA"] as! Array<AnyObject>
                for eachData in jsonData{
                    let dataDictionary = eachData as! Dictionary<String,AnyObject>
                        
                    let book = Book()
                    if !(dataDictionary["ID"] is NSNull){
                        book.id = dataDictionary["ID"] as! Int
                    }
                    if !(dataDictionary["TITLE"] is NSNull){
                        book.title = dataDictionary["TITLE"] as! String
                    }
                    if !(dataDictionary["DESCRIPTION"] is NSNull) {
                        book.description = dataDictionary["DESCRIPTION"] as! String
                    }
                        
                    if !(dataDictionary["IMAGE"] is NSNull){
                        book.imageUrl = dataDictionary["IMAGE"] as! String
                        print(book.imageUrl)
                    }
                    books.append(book)
                }
                
                
                self.delegate.niFetchDataResponseSuccess!(responseData: books)
                
                
            }catch{ let err = NSError(); print("*** \(err) ***")}
        }.resume()
    }
    
    func UploadBook(book:Book, uploadComplete:@escaping UploadComplete){
        var request: URLRequest = URLRequest(url: URL(string: BOOK_CREATE_URL)!)
        request.addValue(HEDER, forHTTPHeaderField: AUTHERTICATION)        
        request.httpMethod = "POST"
        request.httpBody = BOOK_DATA.getData(book: book).data(using: .utf8)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        print("Form data \(BOOK_DATA.getData(book: book))")
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let _ = data, error == nil else {
                if let error = error as? NSError{
                    self.delegate?.niFetchErrorFromClient!(errorMessage : error)
                }
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // check for http errors
                self.delegate?.niFetchDataResponseHTTPEroro!(errorResponse: httpStatus)
                return
            }
        }.resume()
    }
    
    func DeleteBook(book:Book){
        var request: URLRequest = URLRequest(url: URL(string: BOOK_DELETE_URL.appending("\(book.id!)"))!)
        request.addValue(HEDER, forHTTPHeaderField: AUTHERTICATION)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Accept")       
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let _ = data, error == nil else {
                if let error = error as? NSError{
                    self.delegate?.niFetchErrorFromClient!(errorMessage : error)
                }
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // check for http errors
                self.delegate?.niFetchDataResponseHTTPEroro!(errorResponse: httpStatus)
                return
            }
        }.resume()
    }
}
