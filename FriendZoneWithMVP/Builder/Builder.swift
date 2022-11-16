//
//  Builder.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import UIKit

class Builder: BuilderProtocol {
    func createMainVC(router : MainRouterProtocol) -> UIViewController{
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let mainVC = storyBoard.instantiateViewController(withIdentifier: "ListOfFriendsVC") as? ListOfFriendsVC else{fatalError("Could not create VC")}
        mainVC.title = "My Friends"
        let presenter = MainPresenter(mainView: mainVC, router: router)
        mainVC.presenter = presenter
        return mainVC
    }

    func createDetailVC(position : Int,
                        router: MainRouterProtocol
                        , friends : [Friend]
    )->UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailsVC = storyBoard.instantiateViewController(withIdentifier: "details") as? DetailsVC else{fatalError("Could not create VC")}
        detailsVC.title = "Details"
        let presenter = DetailPresenter(
            position: position,
            friends: friends,
            router : router)
        presenter.view = detailsVC
        detailsVC.presenter = presenter
        return detailsVC
    }

    
}
