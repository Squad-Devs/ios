//
//  StationData.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 02.10.2023.
//

import Foundation

struct Stations: Decodable {
    let stations: [OneStation]
}

struct OneStation: Codable {
    let id: String
    let name: String
    let line: String
    let city: String
    let nextStationID: String?
    let prevStationID: String?
    let transferTo: String?

    enum CodingKeys: String, CodingKey {
            case id, name, line, city
            case nextStationID = "nextStationId"
            case prevStationID = "prevStationId"
            case transferTo
        }
}

struct DetailStation: Codable {
    let station: OneStation
}

enum City: String, Codable {
    case kharkiv = "Харків"
}

enum Line: String, Codable {
    case alexLine = "Олексіївська лінія"
    case salticLine = "Салтівська лінія"
    case coldRockManufactureLine = "Холодногірсько-заводська лінія"
}
