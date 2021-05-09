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
    var a:[String] = []
    
    
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
    
    /**
     * 實作TableView方法，自動出現左滑功能
    **/
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath)
    {
        let select:Int = indexPath.row
        
        print("hello delete")
        
        contents.remove(at: indexPath.row)
        //=========
        // 操作
        //=========
        tableView.reloadData() // 更新tableView
    }
    
    /**
     * 自訂delete的文字為刪除
     */
    func tableView(_ tableView: UITableView,
                            titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath)
            -> String?
    {
        return "刪除"
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header  = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        header.text = " 這是 Header "
        header.backgroundColor = UIColor.yellow
        
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell") as! MyTableViewCell
        cell.headerImg.clipsToBounds = true
        cell.headerImg.layer.cornerRadius = 20
        cell.phone.text = contents[indexPath.row]["phone"]
        cell.name.text = contents[indexPath.row]["name"]
        return cell
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

    @IBAction func sort(_ sender: Any) {
        print("start sort")
        
        
        contents.sort { item1, item2 in
            let name1 = item1["phone"] ?? ""
            let name2 = item2["phone"] ?? ""
            return name1 > name2
        }
        
        theTableView.reloadData()
        
        
    }
}

