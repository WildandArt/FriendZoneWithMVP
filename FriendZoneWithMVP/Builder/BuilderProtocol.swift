//
//  BuilderProtocol.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import UIKit

protocol BuilderProtocol {
    func createMainVC(
        router: MainRouterProtocol
    )->UIViewController
    func createDetailVC(position : Int,
                        router : MainRouterProtocol,
                        friends : [Friend]
                        )->UIViewController
}
