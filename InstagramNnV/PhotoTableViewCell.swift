//
//  PhotoTableViewCell.swift
//  InstagramNnV
//
//  Created by Nguyen T Do on 3/9/16.
//  Copyright © 2016 Nguyen Do. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
