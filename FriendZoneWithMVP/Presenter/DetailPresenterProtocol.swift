//
//  DetailPresenterProtocol.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import Foundation

protocol DetailPresenterProtocol : PersistenceManagerProtocol {
    //var friend : Friend{get set}
    var position : Int{get set}
    var friends : [Friend] {get set}
    func updateFriends(with friend : Friend)
}
