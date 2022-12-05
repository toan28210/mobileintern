//
//  SliderFooterDataModel.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 24/11/2022.
//

import Foundation

struct SlideFooterDataModel: Codable {
    var image: String
    var title: String
}

extension SlideFooterDataModel: Identifiable {
    var id: UUID {
        let id = UUID()
        return id
    }
}
