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
    @IBOutlet weak var candidateImageView: UIImageView!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    
    let currentUser : String = {
        guard let thisUser = FIRAuth.auth()?.currentUser?.uid else {
            return ""
        }
        return thisUser
    }()
    
    let unmatchUsers = [String]()
    let matchedUsers = [String]()
    var ref: FIRDatabaseReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(handleProfile))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Matches", style: .plain, target: self, action: #selector(handleMatches))
        
        ref = FIRDatabase.database().reference()
        fetchUnmatchUsers()
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
    
    func fetchUnmatchUsers() {
        ref.child("users").observe(.value, with:
            {(snapshot) in
                if let dictionary = snapshot.value as? [String : AnyObject] {
                    print(dictionary)
                    
                    for userID in dictionary.keys {
                        unmatchUsers.append(userID)
    
                    }
        
                }
                
            }, withCancel: nil)
    }
    

}
