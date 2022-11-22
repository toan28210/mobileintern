//
//  ScrolingData.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import Foundation

struct ContentData {
    let image: String
    let star: String
    let limitAge: String
    let name: String
}

struct FooterScrollData {
    let image: String
    let title: String

    init(image: String, title: String) {
        self.image = image
        self.title = title
    }
}
