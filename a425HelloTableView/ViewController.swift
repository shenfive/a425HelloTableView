//
//  ViewController.swift
//  a425HelloTableView
//
//  Created by 申潤五 on 2021/5/2.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    
    @IBOutlet weak var theTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theTableView.dataSource = self
    }


    //MARK: TableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        switch section {
        case 0:
            count = 5
        case 1:
            count = 3
        default:
            break
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell.backgroundColor = UIColor.red
        case 1:
            cell.backgroundColor = UIColor.yellow
        default:
            break
        }
        
        return cell
    }
    
    
}

