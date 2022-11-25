//
//  FlimDataModel.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 24/11/2022.
//

import Foundation

struct FlimDataModel {
    let flimName: String
    let flimImage: String
    let evalute: String
    let limitAge: String

    init(flimName: String, flimImage: String, evalute: String, limitAge: String) {
        self.flimName = flimName
        self.flimImage = flimImage
        self.evalute = evalute
        self.limitAge = limitAge
    }
}
