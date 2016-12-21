//
//  MatchedProfilesViewController.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit

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
        
        
    }
    
    func handleBack() {
        dismiss(animated: true, completion: nil)
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
