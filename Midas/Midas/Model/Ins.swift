//
//  Ins.swift
//  Midas
//
//  Created by 銀色魔頭號 on 2017/12/27.
//  Copyright © 2017年 Dressrose. All rights reserved.
//

import UIKit

// 🎬 https://www.instagram.com/p/BdOBwNTnW0h/
// 🖼 https://www.instagram.com/p/BdsmoFrlhbI/

struct Ins: CodableType {
    
    var id: String
    var username: String
    var profile_pic_url: String
    var tweets: String
    var isVideo: Bool
    var dimensions: Size
    var images: [String]
    var video_url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case profile_pic_url
        case tweets
        case isVideo = "is_video"
        case dimensions
        case images = "image_urls"
        case video_url
    }
}

struct Size: CodableType {
    
    var width: CGFloat
    var height: CGFloat
    
    enum CodingKeys: String, CodingKey {
        case width
        case height
    }
}





