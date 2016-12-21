//
//  MatchedProfileTableViewCell.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit

class MatchedProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var matchedProfileImageView: UIImageView!
    @IBOutlet weak var matchedProfileNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
