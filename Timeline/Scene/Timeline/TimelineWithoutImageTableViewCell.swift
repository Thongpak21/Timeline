//
//  TimelineWithoutImageTableViewCell.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import UIKit

class TimelineWithoutImageTableViewCell: UITableViewCell {
    static let identifier = "TimelineWithoutImageTableViewCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func config(viewModel: TimelineTableViewCellViewModel?) {
        titleLabel.text = viewModel?.timeline.title
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
