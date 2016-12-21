//
//  User.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class User {
    
    var name = ""
    var age = ""
    var email = ""
    var password = ""
    var gender = ""
    var description = ""
    var profileImage = ""
    var unmatchUsers = [String]()
    var matchedUsers = [String]()
    
    init() {
        name = ""
        age = ""
        email = ""
        password = ""
        gender = ""
        description = ""
        profileImage = ""
        unmatchUsers = [String]()
        matchedUsers = [String]()
    }
    
//    convenience init(currentUser : String) {
//        self.init()
//        FIRDatabase.database().reference().child("users").child(currentUser).observe(.value, with:
//            {(snapshot) in
//                if let dictionary = snapshot.value as? [String : AnyObject] {
//                    print(dictionary)
//                    
//                    for value in dictionary {
//                        self.name = (dictionary["name"] as! String?)!
//                        self.age = (dictionary["name"] as! String?)!
//                        self.email = (dictionary["email"] as! String?)!
//                        self.password = (dictionary["password"] as! String?)!
//                        self.gender = (dictionary["gender"] as! String?)!
//                        self.description = (dictionary["description"] as! String?)!
//                        self.unmatchUsers = (dictionary["matchedUsers"] as! [String])
//                        self.profileImage = (dictionary["profileImage"] as! String?)!
//                    }
//                    
//                }
//            }, withCancel: nil)

  //  }
    
    
  
    
    
    
    
    
}
