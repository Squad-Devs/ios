//
//  CityViewBuilder.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 16.01.2024.
//

import UIKit

class CityViewBuilder {
    private var title: String = ""
    private var imageCity: UIImageView = UIImageView()

    func setTitle(_ title: String) -> CityViewBuilder {
        self.title = title
        return self
    }

    func setImage(_ image: String) -> CityViewBuilder {
        self.imageCity.image = UIImage(named: image)
        return self
    }

    func build() -> UIView {
        let cityView = UIView()
        var cityLabel = UILabel()

        cityLabel.text = title

        cityView.translatesAutoresizingMaskIntoConstraints = false
        cityView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        cityView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        cityView.layer.cornerRadius = 16

        cityView.backgroundColor = UIColor.white
        cityView.layer.shadowColor = UIColor.black.cgColor
        cityView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cityView.layer.shadowOpacity = 0.2
        cityView.layer.shadowRadius = 2

        imageCity.contentMode = .scaleToFill
        imageCity.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageCity.heightAnchor.constraint(equalToConstant: 48).isActive = true

        cityLabel = createLabel(width: 16, weight: .regular, text: title)

        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false

        vStack.addArrangedSubview(imageCity)
        vStack.addArrangedSubview(cityLabel)

        cityView.addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: cityView.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: cityView.centerYAnchor)
        ])

        return cityView
    }

    private func createLabel(width: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: width, weight: weight)
        label.text = text
        return label
    }
}
