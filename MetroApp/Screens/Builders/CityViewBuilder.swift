//
//  CityViewBuilder.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 16.01.2024.
//

import UIKit


// move to VM
protocol CityViewStyle {
//    getter
    var title: String { get }
    var imageCity: UIImage { get }

//  4 fields for style
    var shadowSettings: ShadowSettings { get }
    var size: CGFloat { get }
    var imageSize: CGSize { get }
    var cornerRadius: CGFloat { get }
    var backgroundColor: UIColor { get }
}

// TODO: - struct for default style



struct CityViewModel: CityViewStyle {
    let title: String
    let imageCity: UIImage
}

extension CityViewModel {
    static var kyiv: CityViewModel { CityViewModel(title: "Київ", imageCity: UIImage(resource: .kyivImg)) }
    static var kharkiv: CityViewModel { CityViewModel(title: "Харків", imageCity: UIImage(resource: .kharkivImg)) }
}

extension CityViewStyle {
    var shadowSettings: ShadowSettings { .default }
    var size: CGFloat { 115 }
    var imageSize: CGSize { CGSize(width: 40, height: 48) }
    var cornerRadius: CGFloat { 16 }
    var backgroundColor: UIColor { .white }
}

struct ShadowSettings {
    let shadowColor: CGColor?
    let shadowOffset: CGSize
    let shadowOpacity: Float
    let shadowRadius: CGFloat
}

extension ShadowSettings {
    static var `default`: ShadowSettings {
        ShadowSettings(shadowColor: UIColor.black.cgColor,
                       shadowOffset: CGSize(width: 0.0, height: 2.0),
                       shadowOpacity: 0.2,
                       shadowRadius: 2)
    }
}

class CityViewBuilder {
    func build(style: CityViewStyle) -> UIView {
        let cityView = UIView()
        cityView.translatesAutoresizingMaskIntoConstraints = false

        cityView.widthAnchor.constraint(equalToConstant: style.size).isActive = true
        cityView.heightAnchor.constraint(equalToConstant: style.size).isActive = true
        cityView.layer.cornerRadius = style.cornerRadius
        cityView.backgroundColor = style.backgroundColor

        cityView.layer.shadowColor = style.shadowSettings.shadowColor
        cityView.layer.shadowOffset = style.shadowSettings.shadowOffset
        cityView.layer.shadowOpacity = style.shadowSettings.shadowOpacity
        cityView.layer.shadowRadius = style.shadowSettings.shadowRadius

        let imageCity: UIImageView = UIImageView(image: style.imageCity)
        imageCity.contentMode = .scaleToFill
        imageCity.widthAnchor.constraint(equalToConstant: style.imageSize.width).isActive = true
        imageCity.heightAnchor.constraint(equalToConstant: style.imageSize.height).isActive = true

        let cityLabel = createLabel(width: 16, weight: .regular, text: style.title)

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
