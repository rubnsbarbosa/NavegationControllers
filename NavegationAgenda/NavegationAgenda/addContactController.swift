//
//  addContactController.swift
//  NavegationAgenda
//
//  Created by IFCE on 02/06/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit

protocol addContactControllerDelegate: NSObjectProtocol {
    
    func addContactController(_ viewControler: addContactController, didCreateContact contact: Contact)
    
    func addContactControllerDidCancelCreatingContact(_ viewController: addContactController)
    
}

class addContactController: UIViewController {

    @IBOutlet weak var contactNameField: UITextField!
    @IBOutlet weak var contactPhoneField: UITextField!
    
    weak var delegate: addContactControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func saveContact(_ sender: UIBarButtonItem) {
        
        guard let name = contactNameField.text else {
            return
        }
        
        guard let phoneNumber = contactPhoneField.text else {
            return
        }
        
        let newContact = Contact(name: name, phone: phoneNumber)
        
        delegate?.addContactController(self, didCreateContact: newContact)
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        delegate?.addContactControllerDidCancelCreatingContact(self)
        
    }

}
