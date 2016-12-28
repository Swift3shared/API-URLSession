//
//  Configuration.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/6/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

let BOOK_URL = "http://120.136.24.174:1301/v1/api/articles?page=2&limit=15"
let BOOK_CREATE_URL = "http://120.136.24.174:1301/v1/api/articles"
let BOOK_DELETE_URL = "http://120.136.24.174:1301/v1/api/articles/"
let HEDER = "Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ="
let AUTHERTICATION = "Authorization"
let UPLOAD_SINGLE_FIEL = "http://120.136.24.174:1301/v1/api/uploadfile/single"

let CATEGORY_ID = "\"CATEGORY_ID\": 0"
let STATUS = "\"STATUS\": \"No more\""
let IMAGE = "\"IMAGE\": "
let TITLE = "\"TITLE\": "
let DESCRIPTON = "\"DESCRIPTION\": "
let AUTHOR = "\"AUTHOR\": 0"

typealias DownLoadComplete = ([Book]) -> ()
typealias DeleteComplete = () -> ()
typealias UploadComplete = (Book) -> ()
typealias UploadFileComplete = (String) -> ()

struct BOOK_DATA {
    static func getData(book:Book)-> String{
        return "{\n\(TITLE)\"\(book.title!)\",\n\(DESCRIPTON)\"\(book.description!)\",\n\(IMAGE)\"\(book.imageUrl!)\",\n\(CATEGORY_ID),\n\(STATUS),\n\(AUTHOR)\n}"
    }   
}

//var dictData:[String:AnyObject]
