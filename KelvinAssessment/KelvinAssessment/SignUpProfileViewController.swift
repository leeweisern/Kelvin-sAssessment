//
//  SignUpProfileViewController.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit

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
        
        
        
    }

    
    
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
