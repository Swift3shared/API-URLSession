//
//  ResturantCell.swift
//  SerVerCommunication
//
//  Created by sok channy on 12/6/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func configuration(book:Book) {
        titleLabel.text = book.title ?? "No name"
        descriptionLabel.text = book.description ?? "No descprintion"
        let url = URL(string: book.imageUrl ?? "http://r.ddmcdn.com/s_f/o_1/cx_633/cy_0/cw_1725/ch_1725/w_720/APL/uploads/2014/11/too-cute-doggone-it-video-playlist.jpg")
        do{
            let data = try Data(contentsOf: url!)
            let image = UIImage(data: data)
            bookImageView.image = image
        }catch{
            
        }
    }
    
}
