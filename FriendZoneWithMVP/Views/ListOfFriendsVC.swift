//
//  ListOfFriendsVC.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import UIKit

class ListOfFriendsVC: UITableViewController, MainViewProtocol {

    var presenter: MainPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriend))
        print("viewdid")
        presenter?.loadData()
        tableView.reloadData()
    }
    @objc func addFriend(){
        let friend = Friend()
        presenter?.friends.append(friend)
        presenter?.saveData()
        presenter?.router.createDetailVC(position: ((presenter?.friends.count)! - 1),
            friends: (presenter?.friends)!)

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.friends.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = presenter?.friends[indexPath.row].name
        cell.contentConfiguration = configuration
        return cell

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //guard let friend = presenter?.friends[indexPath.row] else {return}
        presenter?.router.createDetailVC(position: indexPath.row, friends: (presenter?.friends)!)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadData()
        tableView.reloadData()
    }
}
