//
//  DetailNavigator.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import UIKit
import Domain

protocol DetailNavigator {

}

class DefaultDetailNavigator: DetailNavigator {
    let storyBoard: UIStoryboard
    private let navigationController: UINavigationController
    let viewController: DetailViewController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        viewController = storyBoard.instantiateViewController(ofType: DetailViewController.self)
    }

}
