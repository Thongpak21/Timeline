//
//  DetailTableViewCell.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import UIKit
import Domain

class DetailTableViewCell: UITableViewCell {
    static let identifier = "DetailTableViewCell"
    @IBOutlet weak var albumImageView: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        albumImageView.image = UIImage(named: "placeholder")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(album: AlbumResult) {
        albumImageView.kf.setImage(with: album.thumbnail, placeholder: UIImage(named: "placeholder"), options: [.transition(.fade(0.3))])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


