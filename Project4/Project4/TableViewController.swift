//
//  TableViewController.swift
//  Project4
//
//  Created by Розалия on 20.07.2020.
//  Copyright © 2020 Розалия. All rights reserved.
//

import Foundation
import UIKit
import WebKit


class TableViewController: UITableViewController  {
   static var websites = ["apple.com", "hackingwithswift.com", "vk.com"]
    let cellIdentifire = "page"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List of websites"
        navigationController?.navigationBar.prefersLargeTitles = true
    
    }
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewController.websites.count
    }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
            cell.textLabel?.text = TableViewController.websites[indexPath.row]
            return cell
    }

        // MARK: - Navigation

    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let vc = storyboard?.instantiateViewController(withIdentifier: ViewController.viewIdentifier) as? ViewController {
                vc.website = TableViewController.websites[indexPath.row]
                print(indexPath.row)
                navigationController?.pushViewController(vc, animated: true)
            }
        }

         }


