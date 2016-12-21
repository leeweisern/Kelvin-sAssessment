//
//  MatchedProfilesViewController.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class MatchedProfilesViewController: UIViewController {
    @IBOutlet weak var matchedProfileTableView: UITableView! {
        didSet {
            matchedProfileTableView.delegate = self
            matchedProfileTableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(handleBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        
    }
    
    func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleSignOut() {
        let popUp = UIAlertController(title: "Log Out", message: "yes or no", preferredStyle: .alert)
        let noButton = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        let yesButton = UIAlertAction(title: "YES", style: .default){ (action) in
            do
            {
                try FIRAuth.auth()?.signOut()
                
            }
            catch let logoutError {
                print(logoutError)
            }
            self.notifySuccessLogout()
        }
        popUp.addAction(noButton)
        popUp.addAction(yesButton)
        present(popUp, animated: true, completion: nil)
    }
    
    func notifySuccessLogout()
    {
        let UserLogoutNotification = Notification (name: Notification.Name(rawValue: "UserLogoutNotification"), object: nil, userInfo: nil)
        NotificationCenter.default.post(UserLogoutNotification)
    }


}


extension MatchedProfilesViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MatchedProfileTableViewCell
    
        return cell
        
    }
}

extension MatchedProfilesViewController: UITableViewDelegate
{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        i = indexPath.row
//        self.moveToNextViewController()
//    }
}
