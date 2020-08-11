//
//  HomeViewController.swift
//  Timeline
//
//  Created by Thongpak Pongsilathong on 15/7/2563 BE.
//  Copyright © 2563 Thongpak Pongsilathong. All rights reserved.
//

import UIKit
import RxSwift
import Domain
import Network

class TimelineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: TimelineViewModel!
    let disposeBag = DisposeBag()
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setSearch()
        bindViewModel()
        title = "Timeline"

    }
    
    private func setSearch() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        searchController.searchBar.rx
            .text
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (text) in
                guard let self = self else { return }
                self.viewModel.input.search(text: text ?? "")
            }).disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    }

    @objc func refresh(_ sender: AnyObject) {
        viewModel.input.fetchTimeline()
    }

    private func bindViewModel() {
        viewModel.output.isLoading.subscribe(onNext: { [weak self] (isLoading) in
            guard let self = self else { return }
            if isLoading {
                self.refreshControl.beginRefreshing()
            }
        }).disposed(by: disposeBag)
        
        viewModel.output.didFetchTimeline.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }).disposed(by: disposeBag)
        viewModel.input.fetchTimeline()
    }

}

extension TimelineViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.numOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.output.hasAlbum(for: indexPath) {
            let cell = tableView.dequeueReusableCell(withIdentifier: TimelineTableViewCell.identifier, for: indexPath) as! TimelineTableViewCell
            cell.config(viewModel: viewModel.output.dataForRow(for: indexPath))
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TimelineWithoutImageTableViewCell.identifier, for: indexPath) as! TimelineWithoutImageTableViewCell
            cell.config(viewModel: viewModel.output.dataForRow(for: indexPath))
            return cell
        }
    }
    
}

extension TimelineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.input.didSelect(indexPath: indexPath)
    }
    
}
