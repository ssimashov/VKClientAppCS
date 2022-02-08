//
//  GroupsViewController.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 24.11.2021.
//

import UIKit

class GroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sourceArray = [Group]()
    
    let customCellReuseIdentifier = "customCellReuseIdentifier"
    let heightCustomTableViewCell:CGFloat = 150
    
    let variable1 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customCellReuseIdentifier)
        NotificationCenter.default.addObserver(self, selector: #selector(addGroup(_:)), name: NSNotification.Name("groupSelectedNotification"), object: nil)
    }

    
    @objc func addGroup(_ notification: Notification) {
        guard let groupObject = notification.object as? Group else {return}
        
//        print(groupObject.name)
    
        if sourceArray.contains(where: { sourceGroup in
            sourceGroup.name == groupObject.name
        }) {
            print("Такая группа уже есть")
        }
        else {
            sourceArray.append(groupObject)
            tableView.reloadData()
        }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension GroupsViewController: UITableViewDataSource, UITableViewDelegate {
    
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


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alertController = UIAlertController(title: "Delete cell", message: "Вы уверены что хотите удалить?", preferredStyle: .actionSheet)
            let actionYes = UIAlertAction(title: "Yes", style: .default) {[weak self] _ in
                guard let self = self else {return}
                self.sourceArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            alertController.addAction(actionYes)
            let actionNo = UIAlertAction(title: "No", style: .cancel, handler: nil)
            alertController.addAction(actionNo)
            
            self.present(alertController, animated: true, completion: nil)
        }
}
}
