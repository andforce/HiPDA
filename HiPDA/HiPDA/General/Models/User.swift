//
//  User.swift
//  HiPDA
//
//  Created by leizh007 on 16/7/23.
//  Copyright © 2016年 HiPDA. All rights reserved.
//

import Foundation

/// 帖子用户头像分辨率
///
/// - big:    分辨率：高
/// - middle: 分辨率：中
/// - small:  分辨率：低
enum UserAvatarImageResolution: String {
    case big, middle, small
}


/// 帖子用户
struct User {
    let name: String
    let uid: Int
    
    /// 根据分辨率获取帖子用户的头像URL
    ///
    /// - parameter resolution: 头像的分辨率
    ///
    /// - returns: 相应分辨率的头像URL
    func avatarImageURL(resolution: UserAvatarImageResolution) -> URL {
        return URL(string: String(format: "http://img.hi-pda.com/forum/uc_server/data/avatar/%03ld/%02ld/%02ld/%02ld_avatar_%@.jpg", uid/1000000, (uid%1000000)/10000, (uid%10000)/100, uid%100, resolution.rawValue))!
    }
}

// MARK: - Serializable

extension User: Serializable {
    init(_ data: Data) {
        let dictionary = NSKeyedUnarchiver.unarchiveObject(with: data) as! NSDictionary
        name = dictionary["name"] as! String
        uid = dictionary["uid"] as! Int
    }
    
    func encode() -> Data {
        let dictionary: [String : Any] = ["name": name,
                                          "uid": uid]
        
        return NSKeyedArchiver.archivedData(withRootObject: dictionary)
    }
}

// MARK: - Equalable

extension User: Equatable {
    
}

func ==(lhs: User, rhs: User) -> Bool {
    return lhs.uid == rhs.uid && lhs.name == rhs.name
}
