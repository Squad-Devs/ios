//
//  MainViewController.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 25.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var stations: [OneStation] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    let refreshControl = UIRefreshControl()
    let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        tableView.dataSource = self
        tableView.delegate = self

        let stationManager = StationManager()
        stationManager.readLocalJSONFile { [weak self]  result in
            self?.stations = result
            print(self!.stations)
        }

        tableView.registerCell(type: MyTableViewCell.self)

        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(send: UIRefreshControl) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

