//
//  DetailPresenter.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import Foundation
class DetailPresenter : DetailPresenterProtocol  {
    //var friend: Friend
    var position : Int
    var friends : [Friend]
    var router : MainRouterProtocol
    let defaults = UserDefaults.standard

    weak var view : DetailViewProtocol?

    init(
        position : Int,
        friends : [Friend],
        router : MainRouterProtocol
         ) {
        self.router = router
        self.friends = friends
        self.position = position
    }
    func updateFriends(with friend : Friend){
        self.friends[position] = friend
        saveData()
    }
}
extension DetailPresenter {
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

