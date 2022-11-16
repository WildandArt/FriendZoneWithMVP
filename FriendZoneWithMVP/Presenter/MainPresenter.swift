//
//  MainPresenter.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import Foundation
class MainPresenter : MainPresenterProtocol{
    var friends = [Friend]()
    let router : MainRouterProtocol
    let defaults = UserDefaults.standard
    static let friendsKey = "friends"

    weak var mainView: MainViewProtocol?

    init(mainView: MainViewProtocol,
         router : MainRouterProtocol) {
        self.mainView = mainView
        self.router = router
    }
}

extension MainPresenter : PersistenceManagerProtocol{
    func loadData(){
        let decoder = JSONDecoder()
        guard let loadedFriends = defaults.data(forKey: MainPresenter.friendsKey) else{return}
        friends = try! decoder.decode([Friend].self, from: loadedFriends)
    }
    func saveData(){
        let encoder = JSONEncoder()
        let encoded = try! encoder.encode(friends)
        defaults.set(encoded, forKey: MainPresenter.friendsKey)
    }
}
