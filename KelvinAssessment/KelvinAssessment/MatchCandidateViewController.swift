//
//  MatchCandidateViewController.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MatchCandidateViewController: UIViewController {
    @IBOutlet weak var matchCandidateTableView: UITableView! {
        didSet {
            matchCandidateTableView.delegate = self
            matchCandidateTableView.dataSource = self
        }
    }

    let currentUser : String = {
        guard let thisUser = FIRAuth.auth()?.currentUser?.uid else {
            return ""
        }
        return thisUser
    }()

    var thisUser = User()
    var allUser = [String]()
    var unmatchUser = [String]()
    var unmatchUserData = [User]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(handleProfile))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Matches", style: .plain, target: self, action: #selector(handleMatches))
        
        fetchAllUsers()
    }

    func handleProfile() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.init(identifier: "Main"))
        let signUpProfileViewController = storyboard.instantiateViewController(withIdentifier: "SignUpProfileViewController")
        let navController = UINavigationController(rootViewController: signUpProfileViewController)
        self.present(navController, animated: true, completion: nil)
    }
    
    func handleMatches() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.init(identifier: "Main"))
        let matchedProfilesViewController = storyboard.instantiateViewController(withIdentifier: "MatchedProfilesViewController")
        let navController = UINavigationController(rootViewController: matchedProfilesViewController)
        self.present(navController, animated: true, completion: nil)
    }
    
    func fetchAllUsers() {
        FIRDatabase.database().reference().child("users").observe(.value, with:
            {(snapshot) in
                if let dictionary = snapshot.value as? [String : AnyObject] {
                    print(dictionary)
                    
                    for values in dictionary.keys {
                        self.allUser.append(values)
                    }
                    
                    self.allUser = self.allUser.filter{ $0 != self.currentUser }
                    self.fetchUnmatchUsers()
                    
                    if self.thisUser.matchedUsers == [] {
                        for userUID in self.allUser {
                            self.fetchUnmatchUsersData(userUID: userUID)
                        }
                    }
                }
                
            }, withCancel: nil)
    }
    
    func fetchUnmatchUsers() {
        FIRDatabase.database().reference().child("users").child("matchedUsers").observe(.value, with:
            {(snapshot) in
                if let dictionary = snapshot.value as? [String] {
                    print(dictionary)
                    
                    for values in dictionary {
                        self.unmatchUser = self.allUser.filter{ $0 != values }
                    }
                    
                    for userUID in self.unmatchUser {
                        self.fetchUnmatchUsersData(userUID: userUID)
                    }
                }
            }, withCancel: nil)
    }
  
    
    func fetchUnmatchUsersData(userUID: (String)) {
        FIRDatabase.database().reference().child("users").child(userUID).observe(.value, with:
            {(snapshot) in
                if let dictionary = snapshot.value as? [String : AnyObject] {
                    
                    let user = User()
                    user.name = (dictionary["name"] as! String?)!
                    user.profileImage = (dictionary["profileImage"] as! String?)!
                    self.unmatchUserData.append(user)
                    
                    DispatchQueue.main.async(execute: {
                        self.matchCandidateTableView.reloadData()
                    })
                }
            }, withCancel: nil)
    }

    

}


extension MatchCandidateViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.unmatchUserData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MatchCandidateTableViewCell
        
        let unmatchUsers = unmatchUserData[indexPath.row]
        
        cell.candidateNameLabel.text = unmatchUsers.name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        <#code#>
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.init(identifier: "Main"))
        let signUpProfileViewController = storyboard.instantiateViewController(withIdentifier: "CandidateDetailViewController")
        let navController = UINavigationController(rootViewController: signUpProfileViewController)
        self.present(navController, animated: true, completion: nil)
    }

}
