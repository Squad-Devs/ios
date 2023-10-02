//
//  MainViewController.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 25.09.2023.
//

import UIKit

class MainViewController: UIViewController {

    var stations: [OneStation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let stationManager = StationManager()
        stationManager.performRequest { [weak self]  result in
            self?.stations = result
            print(self!.stations)
        }
    }
}

