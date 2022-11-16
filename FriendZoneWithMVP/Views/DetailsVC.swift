//
//  DetailsVC.swift
//  FriendZoneWithMVP
//
//  Created by Artemy Ozerski on 14/11/2022.
//

import UIKit

class DetailsVC: UITableViewController {
    var friend : Friend?
    var position : Int?
    var presenter : DetailPresenterProtocol?
    var timeZones = [TimeZone]()
    @IBAction func textFieldChanged(_ sender: UITextField) {
        friend?.name = sender.text ?? ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let position = presenter?.position else{return}
        self.position = position
        friend = presenter?.friends[position]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else{
            return timeZones.count
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as? NameCell else{fatalError("cell creation error")}
            cell.textField.text = friend?.name

            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tzCell", for: indexPath)
            var conf = cell.defaultContentConfiguration()
            conf.text = friend?.timeZone.identifier
            conf.secondaryText = "GMT"
            cell.contentConfiguration = conf
            return cell
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let friend = friend else {return}
        presenter?.updateFriends(with: friend)

    }
}

extension DetailsVC : DetailViewProtocol{


    func setAFriend(friend: Friend) {

    }


}
