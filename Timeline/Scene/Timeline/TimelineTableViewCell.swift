//
//  TimelineTableViewCell.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import UIKit
import Domain
import Kingfisher

class TimelineTableViewCell: UITableViewCell {
    static let identifier = "TimelineTableViewCell"
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var horizontalStackView: UIStackView!
    @IBOutlet private weak var verticalStackView: UIStackView!

    @IBOutlet private weak var firstImageView: UIImageView!
    @IBOutlet private weak var secondImageView: UIImageView!
    @IBOutlet private weak var thirdImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        firstImageView.image = UIImage(named: "placeholder")
        secondImageView.image = UIImage(named: "placeholder")
        thirdImageView.image = UIImage(named: "placeholder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(viewModel: TimelineTableViewCellViewModel?) {
        titleLabel.text = viewModel?.timeline.title
        
        if let album = viewModel?.albums {
            if album.count == 1 {
                firstImageView.kf.setImage(with: album[0].thumbnail, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(0.3))])
            } else if album.count == 2 {
                firstImageView.kf.setImage(with: album[0].thumbnail, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(0.3))])
                secondImageView.kf.setImage(with: album[1].thumbnail, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(0.3))])
            } else if album.count > 2 {
                firstImageView.kf.setImage(with: album[0].thumbnail, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(0.3))])
                secondImageView.kf.setImage(with: album[1].thumbnail, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(0.3))])
                thirdImageView.kf.setImage(with: album[2].thumbnail, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(0.3))])
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


struct TimelineTableViewCellViewModel {
    let timeline: TimelineResult
    let albums: [AlbumResult]
    
    init(with timeline: TimelineResult, albums: [AlbumResult]) {
        self.timeline = timeline
        self.albums = albums
    }
}
