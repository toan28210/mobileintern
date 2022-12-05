//
//  FlimDataModel.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 24/11/2022.
//

import Foundation

struct FlimDataModel: Codable {
    var id: Int
    var flimImage: String
    var flimName: String
    var evaluate: String
    var limitAge: String
    var iscomming: Bool
    var showHome: Bool
    init(id: Int,
         flimImage: String,
         flimName: String,
         evaluate: String,
         limitAge: String,
         iscomming: Bool,
         showHome: Bool) {
        self.id = id
        self.flimImage = flimImage
        self.flimName = flimName
        self.evaluate = evaluate
        self.limitAge = limitAge
        self.iscomming = iscomming
        self.showHome = showHome
    }
}
