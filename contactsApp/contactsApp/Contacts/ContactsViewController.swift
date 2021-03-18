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
        filteredContacs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)  as! ContactsTableViewCell
        let contact = filteredContacs[indexPath.row]
        cell.nameLbl.text = contact.name
        cell.phoneLbl.text = String(contact.phoneNumber)
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filteredContacs = searchText.isEmpty ? contacts : contacts.filter({(dataString: Contacs) -> Bool in
            return dataString.name.range(of: searchText, options: .caseInsensitive) != nil
        })

        tableView.reloadData()
    }
    
}
