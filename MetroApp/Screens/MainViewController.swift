//
//  MainViewController.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 25.09.2023.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
    lazy var yourCityView = YourCityView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(yourCityView)
        yourCityView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
//        self.view.addSubview(box)
//        box.backgroundColor = .green
//        box.snp.makeConstraints { (make) -> Void in
//            make.width.height.equalTo(50)
//            make.center.equalTo(self.view)
//        }
    }
}
