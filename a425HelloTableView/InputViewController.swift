//
//  InputViewController.swift
//  a425HelloTableView
//
//  Created by 申潤五 on 2021/5/2.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func inputClicked(_ sender: Any) {
        let name = nameTF.text ?? ""
        let phoen = phoneTF.text ?? ""
        
        if name.count <= 2 {
            let alert = UIAlertController.init(title: "提示",
                                               message: "名字至少兩個字元",
                                               preferredStyle: .alert)
            
            let action = UIAlertAction.init(title: "OK",
                                            style: .default,
                                            handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if phoen.count < 10 {
            let alert = UIAlertController.init(title: "提示",
                                               message: "電話至少10碼",
                                               preferredStyle: .alert)
            
            let action = UIAlertAction.init(title: "OK",
                                            style: .default,
                                            handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        
        
    }
    
}
