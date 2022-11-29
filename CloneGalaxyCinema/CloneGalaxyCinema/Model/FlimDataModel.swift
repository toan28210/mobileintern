//
//  FlimDataModel.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 24/11/2022.
//

import Foundation

struct FlimDataModel: Codable {
    var flimImage: String
    var flimName: String
    var evaluate: String
    var limitAge: String
    var iscomming: Bool
}

extension FlimDataModel: Identifiable {
    var id: UUID {
        let id = UUID()
        return id
    }
}
