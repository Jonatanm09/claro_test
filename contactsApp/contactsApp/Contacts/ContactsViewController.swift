//
//  ContactsViewController.swift
//  contactsApp
//
//  Created by Jonatan Mendez on 3/16/21.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    //MARK: Vars
    var contacts: [Contacs] = []
    var filteredContacs: [Contacs]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        contacts =  Session.shared.contacs
        filteredContacs = contacts
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contacts =  Session.shared.contacs
        filteredContacs = contacts
        self.view.setNeedsLayout()
        tableView.reloadData()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func edtingMode(_ sender: Any) {
        isEditing = !isEditing
    }
    
    @IBAction func deleteBtnPressed(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            var items = [Contacs]()
            for indexPath in selectedRows  {
                items.append(filteredContacs[indexPath.row])
            }
            for item in items {
                if let index = filteredContacs.firstIndex(where: { (contact) -> Bool in
                    contact.name == item.name
                }) {
                    filteredContacs.remove(at: index)
                }
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
    }
    
    @IBAction func addContactsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToAddContacts", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredContacs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)  as! ContactsTableViewCell
        let contact = filteredContacs[indexPath.row]
        cell.nameLbl.text = contact.name
        cell.phoneLbl.text = String(contact.phoneNumber)
        if(!contact.image.isEmpty){
            cell.contactImg.image = UIImage(contentsOfFile: contact.image)
        }
        else{
            cell.contactImg.image = UIImage(named: "person.crop.square.fill")
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredContacs = searchText.isEmpty ? contacts : contacts.filter({(dataString: Contacs) -> Bool in
            return dataString.name.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
    }
    
}
