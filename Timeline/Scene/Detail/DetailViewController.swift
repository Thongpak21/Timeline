//
//  DetailViewController.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 16/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var viewModel: DetailViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    enum TableViewIndex: Int {
        case detail
        case albums
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.numOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableViewIndex(rawValue: indexPath.section)! {
        case .detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: TimelineWithoutImageTableViewCell.identifier, for: indexPath) as! TimelineWithoutImageTableViewCell
            cell.config(viewModel: viewModel.output.detail())
            return cell
        case .albums:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
            cell.config(album: viewModel.output.album(in: indexPath))
            return cell
        }
    }
}
