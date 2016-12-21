//
//  LoginViewController.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {

    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.loginTextFieldAttributes()
        tf.keyboardType = UIKeyboardType.emailAddress
        tf.placeholder = "  Email Address"
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.loginTextFieldAttributes()
        tf.placeholder = "  Password"
        return tf
    }()
    
    lazy var loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.backgroundColor = (UIColor.blue).cgColor
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(handleLoginUser), for: .touchUpInside)
        return button
    }()
    
    func handleLoginUser() {
//        if emailTextField.text != nil && passwordTextField.text != nil {
//            loginUser(email: emailTextField.text!, password: passwordTextField.text!)
//        } else {
//            let fieldEmptyAlert = UIAlertController.init(title: "Empty Field", message: "Your email or password field is empty, please try again.", preferredStyle: .alert)
//            let okAlertAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
//            fieldEmptyAlert.addAction(okAlertAction)
//            self.present(fieldEmptyAlert, animated: true, completion: nil)
//        }
    }
    
    
    lazy var signUpButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.backgroundColor = (UIColor.blue).cgColor
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(handleSignUpUser), for: .touchUpInside)
        return button
    }()
    
    func handleSignUpUser() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(signUpButton)
        
        
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupSignUpButton()

    }

    
    func setupEmailTextField() {
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 275).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupPasswordTextField() {
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 6).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func setupSignUpButton() {
        signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }

    
}







extension UITextField {
    
    func loginTextFieldAttributes() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor.black
    }
    
}
