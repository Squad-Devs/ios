//
//  MainVC+Extensions.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 03.10.2023.
//

import UIKit

extension MainViewController: UITableViewDelegate {


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: MyTableViewCell.self) else { return .init() }

        if let nextStationID = stations[indexPath.row].transferTo {

            let nextStaion = stations.first { $0.id == nextStationID }

            cell.setContent(station: stations[indexPath.row].name,
                            nameOfCity: stations[indexPath.row].city,
                            nameOfLine: stations[indexPath.row].line,
                            nameOfNextStation: nextStaion?.name ?? "Немає пересадки")
        } else {
            cell.setContent(station: stations[indexPath.row].name,
                            nameOfCity: stations[indexPath.row].city,
                            nameOfLine: stations[indexPath.row].line,
                            nameOfNextStation: "Немає пересадки")
        }

        return cell
    }
}

public extension UITableView {
    /**
     Register nibs faster by passing the type - if for some reason the `identifier` is different then it can be passed
     - Parameter type: UITableViewCell.Type
     - Parameter identifier: String?
     */
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }

    /**
     DequeueCell by passing the type of UITableViewCell
     - Parameter type: UITableViewCell.Type
     */
    func dequeueCell<T: UITableViewCell>(withType type: T.Type) -> T? {
        dequeueReusableCell(withIdentifier: type.identifier) as? T
    }

    /**
     DequeueCell by passing the type of UITableViewCell and IndexPath
     - Parameter type: UITableViewCell.Type
     - Parameter indexPath: IndexPath
     */
    func dequeueCell<T: UITableViewCell>(withType type: T.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }

}

public extension UITableViewCell {
    static var identifier: String { .init(describing: self) }
}
