//
//  CandidateDetailViewController.swift
//  KelvinAssessment
//
//  Created by NEXTAcademy on 12/21/16.
//  Copyright © 2016 NEXTAcademy. All rights reserved.
//

import UIKit

class CandidateDetailViewController: UIViewController {
    @IBOutlet weak var candidateImageView: UIImageView!
    @IBOutlet weak var candidateNameLabel: UILabel!
    @IBOutlet weak var candidateAgeLabel: UILabel!
    @IBOutlet weak var candidateGenderLabel: UILabel!
    @IBOutlet weak var candidateDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(handleBack))
            
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Unmatch", style: .plain, target: self, action: #selector(handleUnmatch))
        
    }

    func handleBack() {
        dismiss(animated: true, completion: nil)
    }

    func handleUnmatch() {
    
    }
    
    
}
