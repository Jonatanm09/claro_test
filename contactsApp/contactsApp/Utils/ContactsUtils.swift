//
//  ContactsUtils.swift
//  contactsApp
//
//  Created by Jonatan Mendez on 3/17/21.
//

class Session {
    static let  shared: Session = Session()
    private init(){}
    
    var contacs = [Contacs]()
}
