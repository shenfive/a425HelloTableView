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
        cell?.headerImg.clipsToBounds = true
        cell?.headerImg.layer.cornerRadius = 20
        cell?.phone.text = contents[indexPath.row]["phone"]
        cell?.name.text = contents[indexPath.row]["name"]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = contents[indexPath.row]["name"] ?? ""
        let phone = contents[indexPath.row]["phone"] ?? ""
        
        
        let alert = UIAlertController(title: "選項",
                                      message: "你選了:\(name) \n\(phone)", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "我知道了", style: .default, handler: nil)
        alert.addAction(okAction)
        
        let deleteAction = UIAlertAction.init(title: "刪除", style: .cancel) { alert in
            print("Delete Action")
            self.contents.remove(at: indexPath.row)
            let userDefault = UserDefaults.standard
            userDefault.setValue(self.contents, forKey: "contents")
            userDefault.synchronize()
            self.theTableView.reloadData()
            
        }
        alert.addAction(deleteAction)
        
        
        
        present(alert, animated: true, completion: nil)
        
        
    }

}

