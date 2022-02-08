//
//  AllGroupsViewController.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 24.11.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sourceArray = [Group]()
    
    let customCellReuseIdentifier = "customCellReuseIdentifier"
    let heightCustomTableViewCell:CGFloat = 150
    
    
    
    
    func groupFillData() {
        let group1 = Group(name: "Президенты", avatar: "GroupAvatar1")
        let group2 = Group(name: "Министры", avatar: "GroupAvatar2")
        let group3 = Group(name: "Любители чая", avatar: "GroupAvatar3")
        let group4 = Group(name: "Paradise", avatar: "GroupAvatar4")
        let group5 = Group(name: "Странные", avatar: "GroupAvatar5")
        let group6 = Group(name: "Цветоводы", avatar: "GroupAvatar6")
        let group7 = Group(name: "Осень", avatar: "GroupAvatar7")
        let group8 = Group(name: "Красивые фото", avatar: "GroupAvatar8")
        let group9 = Group(name: "Цитрус", avatar: "GroupAvatar9")
        let group10 = Group(name: "Франция", avatar: "GroupAvatar10")
        let group11 = Group(name: "Girls", avatar: "GroupAvatar11")
        let group12 = Group(name: "Ягода", avatar: "GroupAvatar12")
        let group13 = Group(name: "Бабочки", avatar: "GroupAvatar13")
  
    
        sourceArray.append(group1)
        sourceArray.append(group2)
        sourceArray.append(group3)
        sourceArray.append(group4)
        sourceArray.append(group5)
        sourceArray.append(group6)
        sourceArray.append(group7)
        sourceArray.append(group8)
        sourceArray.append(group9)
        sourceArray.append(group10)
        sourceArray.append(group11)
        sourceArray.append(group12)
        sourceArray.append(group13)
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
        groupFillData()
    }


}

extension AllGroupsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellReuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
    
        cell.configure(group: sourceArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCustomTableViewCell
    }
}

    extension AllGroupsViewController: UITableViewDelegate {
        
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(sourceArray[indexPath.row].name)
        NotificationCenter.default.post(name: NSNotification.Name("groupSelectedNotification"), object: sourceArray[indexPath.row])
    }
}

