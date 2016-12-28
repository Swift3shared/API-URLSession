//
//  ViewController.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/5/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NIFetchDataDelegate {
    
    var bookContextDelegate: BookContext = BookContext()
    
    @IBOutlet weak var bookTable: UITableView!
    
    let bookContext:BookContext = BookContext()
    var books:[Book]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookTable.dataSource = self
        bookTable.delegate = self
        bookContextDelegate.delegate = self
        bookContextDelegate.fetchBooks()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCellID", for:indexPath) as! BookCell
        cell.configuration(book: books[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) ->Bool {
            return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        func edit(){
            //performSegue(withIdentifier: "edit", sender: self.modelCells[indexPath.row])
        }
        let moreRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Edit", handler:{action, indexpath in
            
        })
        moreRowAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0);
        
        let deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler:{action, indexpath in
            if self.books.count > 0{
                self.bookContextDelegate.DeleteBook(book: self.books[indexPath.row])
                self.books.remove(at: indexPath.row)
                self.bookTable.deleteRows(at: [indexPath], with: .fade)
                self.bookTable.reloadData()
                if self.books.count == 0 {
                    self.bookContextDelegate.fetchBooks()
                }
            }
        });
        
        return [deleteRowAction, moreRowAction];
    }
    
    @IBAction func refreshPressed(_ sender: Any) {
        bookContextDelegate.fetchBooks()
    }
    
    
    func niFetchDataResponseHTTPEroro(errorResponse: HTTPURLResponse) {
        print("Error cod : \(errorResponse.statusCode)")
        print("Error : \(errorResponse)")
    }
    
    func niFetchDataResponseSuccess(responseData: Array<AnyObject>) {
        if responseData.count > 0 {
            books.removeAll()
            for earhObject in responseData{
                books.append(earhObject as! Book)
            }
            bookTable.reloadData()
        }
    }
    
    func niFetchErrorFromClient(errorMessage: NSError) {
        print("Error : \(errorMessage)")
    }
}

