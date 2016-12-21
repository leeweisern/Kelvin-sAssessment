//
//  SignUpProfileViewController.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    lazy var createUpdateAccountButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.backgroundColor = (UIColor.blue).cgColor
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(handleCreateUpdateAccount), for: .touchUpInside)
        return button
    }()
    
    func handleCreateUpdateAccount() {
        FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if (error != nil) {
                print(error!)
                return
            } else {
                let userData = ["email": self.emailTextField.text!,
                                "name": self.nameTextField.text!,
                                "age": self.ageTextField.text!,
                                "gender": self.
                                "profileImage": "default"] as [String : Any]
                    
                self.loginUser(email: self.emailTextField.text!, password: self.passwordTextField.text!)
                    
                let userUID : String? = FIRAuth.auth()?.currentUser?.uid
                let childUpdate = ["\(userUID!)/": userData]
                self.usersFRDBRef.updateChildValues(childUpdate)
            }
        }
    }

    
    var usersFRDBRef : FIRDatabaseReference = FIRDatabase.database().reference(withPath: "users")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(handleBack))
        
        self.view.addSubview(createUpdateAccountButton)
        setupCreateUpdateAccountButton()
        
        
    }
    
    func handleBack() {
        dismiss(animated: true, completion: nil)
    }

    func setupCreateUpdateAccountButton() {
        createUpdateAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        createUpdateAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createUpdateAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createUpdateAccountButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    
    

}
