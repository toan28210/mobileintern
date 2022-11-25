//
//  SliderFooterDataModel.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 24/11/2022.
//

import Foundation

struct SlideFooterData {
    let slideImage: String
    let title: String

    init(slideImage: String, title: String) {
        self.slideImage = slideImage
        self.title = title
    }
}
