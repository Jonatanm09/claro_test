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
    
    //MARK; OULETS
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTxtField: UITextField!
    //MARK: Vars
    var contact: Contacs = Contacs()
    var url: String = "https://picsum.photos/250/150"
    var imageFilePath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImgBtnPressed(_ sender: Any) {
        DispatchQueue.main.async {
            self.getImageFromApi()
        }
    }
    
    private func getImageFromApi(){
        var image = UIImage()
        let randomInt = Int.random(in: 1..<100)
        ProgressHUD.show()
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("image\(randomInt).png")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        AF.download(url, to: destination).response { response in
            if response.error == nil, let imagePath = response.fileURL?.path {
                self.imageFilePath = imagePath
                image = UIImage(contentsOfFile: imagePath)!
                self.imgView.image = image
            }
            ProgressHUD.dismiss()
        }
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
        contact.image = imageFilePath
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
