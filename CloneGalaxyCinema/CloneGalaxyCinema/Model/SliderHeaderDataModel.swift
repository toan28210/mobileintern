//
//  SliderHeaderDataModel.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 24/11/2022.
//

import Foundation

struct SlideHeaderDataModel: Codable {
    var slideHeaderImage: String
}

extension SlideHeaderDataModel: Identifiable {
    var id: UUID {
        let id = UUID()
        return id
    }
}
