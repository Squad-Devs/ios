//
//  MainViewController.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 25.09.2023.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {
//    lazy var yourCityView = YourCityView()

    lazy var box = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green

        view.addSubview(box)
        box.backgroundColor = .black
        box.snp.makeConstraints{ make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
//        self.view.addSubview(box)
//        box.backgroundColor = .green
//        box.snp.makeConstraints { (make) -> Void in
//            make.width.height.equalTo(50)
//            make.center.equalTo(self.view)
//        }
    }
}
