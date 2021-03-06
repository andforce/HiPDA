//
//  UserTests.swift
//  HiPDA
//
//  Created by leizh007 on 16/7/23.
//  Copyright © 2016年 HiPDA. All rights reserved.
//

import XCTest
@testable import HiPDA

class UserTests: XCTestCase {
    /// 测试User的相等性
    func testUserEqual() {
        let user1 = User(name: "leizh007", uid: 697558)
        let user2 = User(name: "leizh007", uid: 697558)
        let user3 = User(name: "德国大炮", uid: 876900)
        
        XCTAssert(user1 == user2, "User should be equal!")
        XCTAssert(user1 != user3, "User should not be equal!")
    }
    
    /// 测试User获取到的头像URL是否正确
    func testAvatarImageURL() {
        let user = User(name: "leizh007", uid: 697558)
        
        let smallResolution = UserAvatarImageResolution.small
        let smallAvatarImageURLString = user.avatarImageURL(resolution: smallResolution).absoluteString
        XCTAssert(smallAvatarImageURLString == "http://img.hi-pda.com/forum/uc_server/data/avatar/000/69/75/58_avatar_small.jpg", "User avatarImageURL create failed!")
        
        let middleResulution = UserAvatarImageResolution.middle
        let middleAvatarImageURLString = user.avatarImageURL(resolution: middleResulution).absoluteString
        XCTAssert(middleAvatarImageURLString == "http://img.hi-pda.com/forum/uc_server/data/avatar/000/69/75/58_avatar_middle.jpg", "User avatarImageURL create failed!")
        
        let bigResolution = UserAvatarImageResolution.big
        let bigAvatarImageURLString = user.avatarImageURL(resolution: bigResolution).absoluteString
        XCTAssert(bigAvatarImageURLString == "http://img.hi-pda.com/forum/uc_server/data/avatar/000/69/75/58_avatar_big.jpg", "User avatarImageURL create failed!")
    }
    
    /// 测试User是否满足序列化
    func testUserSerializable() {
        let user = User(name: "leizh007", uid: 697558)
        let userData = user.encode()
        
        XCTAssert(User(userData) == user, "User should conform to Serializable protocol!")
    }
}
