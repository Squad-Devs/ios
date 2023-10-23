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
    let id, name: String
    let line: Line
    let city: City
    let nextStation, prevStation, transferTo: NextStation?
}

struct DetailStation: Codable {
    let station: OneStation
}

struct NextStation: Codable {
    let id, name: String
}

enum City: String, Codable {
    case kharkiv = "Харків"
}

enum Line: String, Codable {
    case олексіївськаЛінія = "Олексіївська лінія"
    case салтівськаЛінія = "Салтівська лінія"
    case холодногірськоЗаводськаЛінія = "Холодногірсько-заводська лінія"
}

