//
//  MatchCandidateViewController.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit

class MatchCandidateViewController: UIViewController {
    @IBOutlet weak var candidateImageView: UIImageView!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .done, target: self, action: #selector(handleProfile))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Matches", style: .plain, target: self, action: #selector(handleMatches))
    }

    func handleProfile() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleMatches() {
//        let nextController = AlternativeAddressViewController()
//        let navController = UINavigationController(rootViewController: nextController)
//        self.present(navController, animated: true, completion: nil)
    }
    

}
