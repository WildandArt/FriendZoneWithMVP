//
//  DetailViewProtocol.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import Foundation
protocol DetailViewProtocol : AnyObject{
    var presenter : DetailPresenterProtocol?{get set}
    func setAFriend(friend : Friend)
}
