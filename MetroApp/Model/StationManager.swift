//
//  StationManager.swift
//  MetroApp
//
//  Created by Vitalii Navrotskyi on 02.10.2023.
//

import Foundation

struct StationManager {
    func performRequest(completion: (([OneStation]) -> Void)?) {
        let decoder = JSONDecoder()
        if let url = URL(string: Constants.path) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                guard error == nil,
                      let data = data,
                      let decodeData = try? decoder.decode([OneStation].self, from: data) else { return }
                completion?(decodeData)
            }
            task.resume()
        }
    }

    func readLocalJSONFile(completion: (([OneStation]) -> Void)?) {
        let decoder = JSONDecoder()
        do {
            if let filePath = Bundle.main.path(forResource: "Stations", ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                if let decoderData = try? decoder.decode([OneStation].self, from: data)  {
                    completion?(decoderData)
                }
                completion?([]) // Return an empty array if there was an error decoding the JSON data.
            }
        } catch {
            print("error: \(error)")
        }
    }

//    func performRequestForDetail(_ postID: Int?, completion: ((DetailStation) -> Void)?) {
//        guard let savePostID = postID else { return }
//
//        let decoder = JSONDecoder()
//        if let url = URL(string: Constants.path) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, _, error in
//                guard error == nil,
//                      let data = data,
//                      let decoderData = try? decoder.decode(DetailPost.self, from: data) else { return }
//                completion?(decoderData.post)
//            }
//            task.resume()
//        }
//    }
}
