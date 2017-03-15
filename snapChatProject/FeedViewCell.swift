//
//  FeedViewCell.swift
//  snapChatProject
//
//  Created by Clarence Lam on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewCell: UITableViewCell {

    var read = false

    @IBOutlet weak var nameOfSender: UILabel!
    @IBOutlet weak var timeSinceSent: UILabel!
    @IBOutlet weak var redImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
