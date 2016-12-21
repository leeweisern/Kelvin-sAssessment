//
//  Extensions.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

extension UIViewController {
    func loginUser(email: String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: {(user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    switch errorCode {
                    // universal errors
                    case .errorCodeNetworkError:
                        self.displayAlertWith(message: "A network error occured. Please check if you have a valid Internet connection.")
                    case .errorCodeUserNotFound:
                        self.displayAlertWith(message: "Credentials do not match any users in our database. Please check your entered fields again.")
                    case .errorCodeUserTokenExpired:
                        self.displayAlertWith(message: "You have recently changed your password on a different device, please sign in again with your updated credentials.")
                    case .errorCodeTooManyRequests:
                        self.displayAlertWith(message: "You have been temporarily suspended from logging in due to our servers receiving too many requests from your IP address.")
                    case .errorCodeInvalidAPIKey:
                        self.displayAlertWith(message: "The application was configured with an invalid API key, this is abnormal. Please contact admin@projectrecycle.com to allow us to help you.")
                    case .errorCodeAppNotAuthorized:
                        self.displayAlertWith(message: "The application was not authorized to connect to the servers with the provided API key, this is abnormal. Please contact admin@projectrecycle.com to allow us to help you.")
                    case .errorCodeKeychainError:
                        self.displayAlertWith(message: "A keychain error occured. Please contact the administrator at admin@projectrecycle.com to allow us to help you.")
                    case .errorCodeInternalError:
                        self.displayAlertWith(message: "An internal error occured within our servers. Please try again later.")
                    // email & password errors
                    case .errorCodeInvalidEmail:
                        self.displayAlertWith(message: "Invalid email detected. Please check the email you typed in again.")
                    case .errorCodeOperationNotAllowed:
                        self.displayAlertWith(message: "This account has not been enabled in our system. Please contact admin@projectrecycle.com for further details.")
                    case .errorCodeWrongPassword:
                        self.displayAlertWith(message: "Invalid password detected. Please review your password again.")
                    case .errorCodeUserDisabled:
                        self.displayAlertWith(message: "This user has been disabled by the administrator. Please contact admin@projectrecycle.com for further enquiries.")
                    case .errorCodeInvalidCredential:
                        self.displayAlertWith(message: "Invalid credentials detected. Please check your entered fields again.")
                    case .errorCodeUserMismatch:
                        self.displayAlertWith(message: "Invalid re-authentication by a user which is not the current user. Please restart the app and try again.")
                    default: self.displayAlertWith(message: "An unknown error occured.")
                    }
                }
                return
            }
            
            let signedInNotification = Notification(name: Notification.Name(rawValue: "SignedInNotification"), object: nil, userInfo: nil)
            NotificationCenter.default.post(signedInNotification)
            
            FIRAuth.auth()?.addStateDidChangeListener { (auth, user) in
                if user != nil {
                    return
                } else {
                    let signedOutAlert = UIAlertController.init(title: "Signed Out", message: "You have been signed out from Project Recycle.", preferredStyle: .alert)
                    let okAlertAction = UIAlertAction.init(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in
                        let signedOutNotification = Notification(name: Notification.Name(rawValue: "SignedOutNotification"), object: nil, userInfo: nil)
                        NotificationCenter.default.post(signedOutNotification)
                    })
                    signedOutAlert.addAction(okAlertAction)
                    self.present(signedOutAlert, animated: true, completion: nil)
                }
            }
        })
    }
    
    
    
    func displayAlertWith(message: String) {
        let errorAlert = UIAlertController.init(title: "Authentication Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        
        errorAlert.addAction(okAction)
        present(errorAlert, animated: true, completion: nil)
    }
}
