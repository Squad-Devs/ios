//
//  YourCityInfo.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 27.11.2023.
//

import UIKit

struct YourCityInfo {
    let choseCity: MetroCity
    let buttonsCity: [CityButtonThumbnailInfo]
}

enum MetroCity {
    case kyiv
    case kharkiv
}

struct CityButtonThumbnailInfo {
    let image: UIImage
}
