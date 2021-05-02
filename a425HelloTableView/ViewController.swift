//
//  ViewController.swift
//  a425HelloTableView
//
//  Created by 申潤五 on 2021/5/2.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var theTableView: UITableView!
    
    
    var contents:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theTableView.dataSource = self
        theTableView.delegate = self
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userDefault = UserDefaults.standard
        if let c = userDefault.value(forKey: "contents") as? [[String : String]]{
            contents = c
        }
        theTableView.reloadData()
    }

    //MARK: TableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell") as? MyTableViewCell
        cell?.textLabel?.text = "\(indexPath)"
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath)")
    }

}

