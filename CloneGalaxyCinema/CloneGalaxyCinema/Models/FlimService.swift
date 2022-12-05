//
//  FlimService.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 01/12/2022.
//

import Foundation
final class FlimService {
    static let shared = FlimService()
    func getFlimDatas() -> [FlimDataModel] {
        return [
            FlimDataModel(id: 1, flimImage: "anh", flimName: "One Piece 1", evaluate: "9.2", limitAge: "C16", iscomming: true, showHome: true),
            FlimDataModel(id: 2, flimImage: "blackpanther", flimName: "One Piece 2", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: true),
            FlimDataModel(id: 3, flimImage: "anh", flimName: "One Piece 3", evaluate: "9.2", limitAge: "C13", iscomming: true, showHome: true),
            FlimDataModel(id: 4, flimImage: "blackpanther", flimName: "One Piece 4", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: true),
            FlimDataModel(id: 5, flimImage: "anh", flimName: "One Piece 5", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: true),
            FlimDataModel(id: 6, flimImage: "anh", flimName: "One Piece 6", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: true),
            FlimDataModel(id: 7, flimImage: "anh", flimName: "One Piece 7", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: false),
            FlimDataModel(id: 8, flimImage: "blackpanther", flimName: "One Piece 8", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: false),
            FlimDataModel(id: 9, flimImage: "anh", flimName: "One Piece 9", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: false),
            FlimDataModel(id: 10, flimImage: "anh", flimName: "One Piece 10", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: false),
            FlimDataModel(id: 11, flimImage: "anh", flimName: "One Piece 11", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: false),
            FlimDataModel(id: 12, flimImage: "blackpanther", flimName: "One Piece 12", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: false),
            FlimDataModel(id: 13, flimImage: "anh", flimName: "One Piece 13", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: false),
            FlimDataModel(id: 14, flimImage: "blackpanther", flimName: "One Piece 14", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: true),
            FlimDataModel(id: 15, flimImage: "anh", flimName: "One Piece 15", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: true),
            FlimDataModel(id: 16, flimImage: "anh", flimName: "One Piece 16", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: true),
            FlimDataModel(id: 17, flimImage: "blackpanther", flimName: "One Piece 17", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: true),
            FlimDataModel(id: 18, flimImage: "anh", flimName: "One Piece 18", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: false),
            FlimDataModel(id: 19, flimImage: "blackpanther", flimName: "One Piece 19", evaluate: "9.2", limitAge: "P", iscomming: true, showHome: false),
            FlimDataModel(id: 20, flimImage: "anh", flimName: "One Piece 20", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: true),
            FlimDataModel(id: 21, flimImage: "anh", flimName: "One Piece 21", evaluate: "9.2", limitAge: "P", iscomming: false, showHome: true)
        ]
    }
}

extension FlimService {
    func getSlideHeaderDatas() -> [SlideHeaderDataModel] {
        return [
            SlideHeaderDataModel(slideHeaderImage: "rap-moi"),
            SlideHeaderDataModel(slideHeaderImage: "avatar2"),
            SlideHeaderDataModel(slideHeaderImage: "onepiece"),
            SlideHeaderDataModel(slideHeaderImage: "tro-tan"),
            SlideHeaderDataModel(slideHeaderImage: "dem-hung-tan"),
            SlideHeaderDataModel(slideHeaderImage: "hanh-phuc-mau")
        ]
    }
}

extension FlimService {
    func getSlideFooterDatas() -> [SlideFooterDataModel] {
        return [
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim"),
            SlideFooterDataModel(image: "anh", title: "Hôm nay là một ngày tuyệt vời để xem phim")
        ]
    }
}
