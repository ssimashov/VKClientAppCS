//
//  FriendsViewController.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 23.11.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //    var sourceArray = [Friend0]()
    //    var friendsArray = [Friend0]()
    private var friends = [FriendItem](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private var filteredFriends = [FriendItem]()
    private var isSearch: Bool = false
    
    
    let customCellReuseIdentifier = "customCellReuseIdentifier"
    let heightCustomTableViewCell:CGFloat = 150
    let toGallerySegue = "toCollectionViewSegue"
    
    private let networkService = NetworkService()
    private let userID = Session.instance.userId
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        
        networkService.fetchUsers(userID: userID) { [weak self] result in
            switch result {
            case .success(let friends):
                self?.friends = friends
                print(friends)
            case .failure(let error):
                print(error)
            }
        }
        
        searchBar.delegate = self
        filteredFriends = friends
        
    }
    
}

extension FriendsViewController: UITableViewDataSource {
    
    //    func fillFriendsArray() {
    //        let friend1 = Friend(name: "Владимир Путин", avatar: "Putin", fotoArray: ["Putin1", "Putin2", "Putin3", "Putin4", "Putin5"])
    //        let friend2 = Friend(name: "Сергей Лавров", avatar: "Lavrov", fotoArray: ["Lavrov1", "Lavrov2", "Lavrov3", "Lavrov4", "Lavrov5"])
    //        let friend3 = Friend(name: "Владимир Жириновский", avatar: "Zhirik", fotoArray: ["Zhirik1", "Zhirik2", "Zhirik3", "Zhirik4", "Zhirik5"])
    //        let friend4 = Friend(name: "Дмитрий Медведев", avatar: "Medvedev", fotoArray: ["Medvedev1", "Medvedev2", "Medvedev3", "Medvedev4", "Medvedev5"])
    //        let friend5 = Friend(name: "Дональд Трамп", avatar: "Tramp", fotoArray: ["Tramp1", "Tramp2", "Tramp3", "Tramp4", "Tramp5"])
    //
    //        sourceArray.append(friend1)
    //        sourceArray.append(friend2)
    //        sourceArray.append(friend3)
    //        sourceArray.append(friend4)
    //        sourceArray.append(friend5)
    //    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (isSearch){
            return filteredFriends.count
        }
        else {
            return friends.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellReuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        if (isSearch){
            cell.configure(model: filteredFriends[indexPath.row])
            //        cell.configure(friend: friendsArray[indexPath.row])
        }
        
        else {
            cell.configure(model: friends[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCustomTableViewCell
    }
    
    
}

extension FriendsViewController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toGallerySegue {
            guard
                let vc = segue.destination as? GalleryViewController,
                let indexPath = tableView.indexPathForSelectedRow
            else { return }
            vc.friendID = friends[indexPath.row].friendID
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: toGallerySegue, sender: nil)
    }
}


extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredFriends = friends
            isSearch = false
            
        }
        else {
            isSearch = true
            filteredFriends = friends.filter({ friendItem in
                friendItem.friendFirstName.lowercased().contains(searchText.lowercased())
            })
        }
        self.tableView.reloadData()
    }
}




