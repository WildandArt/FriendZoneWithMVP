//
//  RouterProtocol.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import UIKit

protocol RouterProtocol{
    var nav : UINavigationController {get set}
    var builder : BuilderProtocol {get set}
}


