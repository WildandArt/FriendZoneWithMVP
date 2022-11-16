//
//  MainPresenterProtocol.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import Foundation
protocol MainPresenterProtocol {
    var friends : [Friend]{get set}
    var mainView : MainViewProtocol?{get set}
}
