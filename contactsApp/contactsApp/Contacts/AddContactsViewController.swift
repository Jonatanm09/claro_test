//
//  AddContactsViewController.swift
//  contactsApp
//
//  Created by Jonatan Mendez on 3/16/21.
//

import UIKit

class AddContacsViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    
    var contact: Contacs = Contacs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func cancelBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func addImgBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func savebtnPressed(_ sender: Any) {
        guard !self.nameTxtField.text!.isEmpty, !self.lastNameTextField.text!.isEmpty else {
            return
        }
     
        contact.name = self.nameTxtField.text! + " " + self.lastNameTextField.text!
        contact.phoneNumber = self.phoneTextField.text!
        Session.shared.contacs.append(contact)
        
    }
}
