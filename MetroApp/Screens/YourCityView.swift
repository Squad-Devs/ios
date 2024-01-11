//
//  YourCityView.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 27.11.2023.
//

import SnapKit
import UIKit

class YourCityView: UIView {
    // MARK: - Public
    func configure(with info: YourCityInfo) {
        //
    }

    // MARK: - init
    init() {
        super.init(frame: .zero)

        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Constants
    private enum UIConstants {
        static let viewWidth: CGFloat = 45
        static let viewHeight: CGFloat = 190
    }

    // MARK: - Private properties
    private let currentlyCityLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let cityButton: UIButton = {
        let button = UIButton()
        return button
    }()

    private let selectButton: UIButton = {
        let button = UIButton()
        return button
    }()

    private var collectionView: UICollectionView!
    private var buttons: [CityButtonThumbnailInfo] = []
}

// MARK: - Private methods
private extension YourCityView {
    func initialize() {
        backgroundColor = .red
        let yStack = UIStackView()
        yStack.axis = .vertical
        yStack.addArrangedSubview(currentlyCityLabel)
        yStack.addArrangedSubview(cityButton)

        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        yStack.addArrangedSubview(collectionView )
    }
}

// MARK: - UICollectionViewDataSource
extension YourCityView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        .init()
    }


}

// MARK: - UICollectionViewDelegate
extension YourCityView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.viewWidth, height: UIConstants.viewHeight)
    }
}
