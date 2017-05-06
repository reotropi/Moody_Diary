//
//  StoryTableViewCell.swift
//  MoodyDiary
//
//  Created by Aida Fitryani on 5/6/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var storyLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
