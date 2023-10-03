//
//  MyTableViewCell.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 03.10.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfStation: UILabel!
    @IBOutlet weak var nameOfCity: UILabel!
    @IBOutlet weak var nameOfLine: UILabel!
    @IBOutlet weak var nameOfNextStation: UILabel!
    
    static func nib() -> UINib {
         UINib(nibName: Constants.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setContent(station: String, nameOfCity: String, nameOfLine: String, nameOfNextStation: String) {
        nameOfStation.text = station
        self.nameOfCity.text = nameOfCity
        self.nameOfLine.text = nameOfLine
        self.nameOfNextStation.text = nameOfNextStation
    }

}
