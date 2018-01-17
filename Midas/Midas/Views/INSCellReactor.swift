//
//  INSCellReactor.swift
//  Midas
//
//  Created by __End on 2018/1/16.
//  Copyright © 2018年 Dressrose. All rights reserved.
//

import ReactorKit

final class INSCellReactor: Reactor {
    
    typealias Action = NoAction
    
    struct State {
        var avatar: String
        var username: String
        var imageURLs: [String]
        var tweets: String
        var dimensions: Size
    }
    
    let ins: Ins
    var initialState: State
    
    init(_ ins: Ins) {
        self.ins = ins
        self.initialState = State(
            avatar: ins.profile_pic_url,
            username: ins.username,
            imageURLs: ins.images,
            tweets: ins.tweets,
            dimensions: ins.dimensions
        )
        _ = self.state
    }
}





