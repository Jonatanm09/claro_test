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
        performSegue(withIdentifier: "goToContacts", sender: self)
    }
    
}

