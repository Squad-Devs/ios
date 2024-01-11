//
//  MainViewController.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 25.09.2023.
//

import SnapKit
import UIKit

struct ConstantsColor {
    static let inactiveButtonColor = "InactiveButtonColor"
    static let activeButtonColor = "ActiveButtonColor"
}

class MainViewController: UIViewController {
//    lazy var yourCityView = YourCityView()

    lazy var box = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: ConstantsColor.inactiveButtonColor)

        setCircles()

//        view.addSubview(box)
//        box.backgroundColor = .black
//        box.snp.makeConstraints { make in
//            make.width.height.equalTo(100)
//            make.center.equalToSuperview()
//        }
    }

    private func setCircles() {
        let circle1 = createcircle(frame: CGRect(x: view.frame.width - 74, y: -28, width: 100, height: 100))
        let circle2 = createcircle(frame: CGRect(x: 83, y: 100, width: 70, height: 70))
        let circle3 = createcircle(frame: CGRect(x: view.frame.width - 202, y: 216, width: 286, height: 286))
        let circle4 = createcircle(frame: CGRect(x: 83, y: view.frame.height - 272, width: 56, height: 56))
        let circle5 = createcircle(frame: CGRect(x: view.frame.width - 121, y: view.frame.height - 120, width: 97, height: 97))

        [circle1, circle2, circle3, circle4, circle5].forEach { item in
            view.addSubview(item)
        }
    }

    private func createcircle(frame: CGRect) -> UIView {
        let circle = UIView()
        circle.backgroundColor = UIColor(named: ConstantsColor.activeButtonColor)
        circle.frame = frame
        circle.layer.cornerRadius = frame.width / 2
        return circle
    }
}
