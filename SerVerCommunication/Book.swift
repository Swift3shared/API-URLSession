//
//  Resturant.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/6/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

class Book{
    var id:Int!
    var title:String!
    var description:String!
    var imageUrl:String!    
    init(title:String,description:String,imageUrl:String) {
        self.title = title; self.description = description;self.imageUrl = imageUrl
    }
    init() {}
}
