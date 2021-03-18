//
//  AddContactsViewController.swift
//  contactsApp
//
//  Created by Jonatan Mendez on 3/16/21.
//

import UIKit
import Alamofire
import ProgressHUD

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
        ProgressHUD.show()
        guard !self.nameTxtField.text!.isEmpty, !self.lastNameTextField.text!.isEmpty, !self.phoneTextField.text!.isEmpty else {
            getAlert(message: "Todos los campos son obligatorios")
            return
        }
        
        if(phoneTextField.text?.count != 10){
            getAlert(message: "El telefono debe tener 10 numeros")
            return
        }
        
        contact.name = self.nameTxtField.text! + " " + self.lastNameTextField.text!
        contact.phoneNumber = self.phoneTextField.text!
        Session.shared.contacs.append(contact)
        ProgressHUD.dismiss()
        self.dismiss(animated: true, completion: nil)
    }
    
    private func getAlert(message: String){
        let alert = UIAlertController(title: "Ha Ocurrido un Error!", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        ProgressHUD.dismiss()
    }
}
