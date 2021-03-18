//
//  ViewController.swift
//  contactsApp
//
//  Created by Jonatan Mendez on 3/16/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logInBtnPressed(_ sender: Any) {
        
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "myContacts") as? ContactsViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
        performSegue(withIdentifier: "goToContacts", sender: self)
    }
    
}

