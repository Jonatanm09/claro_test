//
//  ContactsViewController.swift
//  contactsApp
//
//  Created by Jonatan Mendez on 3/16/21.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Vars
    var contacts: [Contacs] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        contacts =  Session.shared.contacs
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func addContactsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToAddContacts", sender: self)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)  as! ContactsTableViewCell
        let contact = contacts[indexPath.row]
        cell.nameLbl.text = contact.name
        cell.phoneLbl.text = String(contact.phoneNumber)
        
        return cell
    }
    
}
