//
//  MainRouterProtocol.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import Foundation
protocol MainRouterProtocol : RouterProtocol{
    func createInitialVC()
    func createDetailVC(position : Int, friends : [Friend])
}
