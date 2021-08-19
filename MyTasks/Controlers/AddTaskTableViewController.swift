//
//  AddTaskTableViewController.swift
//  MyTasks
//
//  Created by Volodymyr Pysarenko on 18.08.2021.
//

import UIKit
import Firebase

class AddTaskTableViewController: UITableViewController {
    
    var postData = [String]()
    var databaseHandle: DatabaseHandle?
    private let refDatabase = Database.database().reference().child("Posts")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refDatabase.observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let self = self else {return}
            print("getAllPosts: \(snapshot) ")
        })
        
//        ref = Database.database().reference()
//
//        databaseHandle = ref?.child("Posts").observe(.childAdded, with: {[weak self] (snapshot) in
//
//            let post = snapshot.value as? String
//            if let actualPost = post {
//                self?.postData.append(actualPost)
//
//                self?.tableView.reloadData()
//            }
//        })

    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        refDatabase.childByAutoId().child("name").setValue("Hello")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }


}
