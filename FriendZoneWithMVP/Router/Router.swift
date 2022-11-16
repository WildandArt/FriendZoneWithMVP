//
//  Router.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import UIKit
class Router : MainRouterProtocol{
    var nav: UINavigationController

    var builder: BuilderProtocol

    init(nav: UINavigationController, builder: BuilderProtocol) {
        self.nav = nav
        self.builder = builder
    }
    func createInitialVC() {
        let initialVC = builder.createMainVC(router: self)
        nav.pushViewController(initialVC, animated: true)
    }

    func createDetailVC(position : Int ,
                        friends : [Friend]) {
        let detailVC = builder.createDetailVC(
            position: position,
            router: self, friends: friends)
        nav.pushViewController(detailVC, animated: true)
    }
}
