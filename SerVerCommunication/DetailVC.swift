//
//  DetailVC.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/6/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    let bookContext = BookContext()
    
    @IBOutlet weak var imageUrlTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        let book = Book(title: "Test NINI 12", description: "Just for tesll 12", imageUrl: "https://www.royalcanin.com/~/media/Royal-Canin/Product-Categories/cat-breed-landing-hero.ashx")
        bookContext.UploadBook(book: book){
            bookData in
            
        }
    }
}
