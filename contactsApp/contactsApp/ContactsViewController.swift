//
//  ContactsViewController.swift
//  contactsApp
//
//  Created by Jonatan Mendez on 3/16/21.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var contacts: [Contacs] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        contacts.append(Contacs(name: "Jonatan Mendez", phoneNumber: 8093310918, image: <#T##String#>))
    }

    @IBAction func backBtn(_ sender: Any) {
    }
    
    @IBAction func addContactsBtnPressed(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        return cell
    }
    
}
