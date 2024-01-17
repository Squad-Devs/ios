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

enum CityVariant: String, CaseIterable {
    case kyiv = "Київ"
    case kharkiv = "Харків"
}

class MainViewController: UIViewController {
    private lazy var questionLabel: UILabel = {
        let labelFrame = CGRect(x: 0, y: 0, width: 200, height: 20)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = labelFrame
        label.textColor = .black
        label.text = "З якого ви міста?"
        label.font = UIFont(name: "Roboto-Bold", size: 24)
        return label
    }()

    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: ConstantsColor.inactiveButtonColor)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 16)
        button.layer.cornerRadius = 16
        button.setTitle("Продовжити", for: .normal)

        button.widthAnchor.constraint(equalToConstant: 161).isActive = true
        button.heightAnchor.constraint(equalToConstant: 34).isActive = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setCircles()
        setView()
    }

    private func setView() {
        self.view.backgroundColor = .white

//        let kyivBtn = CityViewBuilder().setTitle("Київ").setImage("KyivImg").build()
//        let kharkivBtn = CityViewBuilder().setTitle("Харків").setImage("KharkivImg").build()

        let kyivBtn = CityViewBuilder().build(style: CityViewModel.kyiv)
        let kharkivBtn = CityViewBuilder().build(style: CityViewModel.kharkiv)

        let stackViewForButtons = UIStackView(arrangedSubviews: [kyivBtn, kharkivBtn])
        stackViewForButtons.axis = .horizontal
        stackViewForButtons.alignment = .center
        stackViewForButtons.distribution = .equalSpacing
        stackViewForButtons.spacing = 16

        let stackView = UIStackView(arrangedSubviews: [questionLabel, stackViewForButtons, continueButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 24

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func createLabel(width: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: "Roboto-Regular", size: width)
        return label
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
