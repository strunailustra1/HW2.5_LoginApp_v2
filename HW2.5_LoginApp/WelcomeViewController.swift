//
//  WelcomeViewController.swift
//  HW2.5_LoginApp
//
//  Created by Наталья Мирная on 08.04.2020.
//  Copyright © 2020 Наталья Мирная. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Public properties
    var welcomeUser: String!
    
    // MARK: - IB Outlets
    @IBOutlet weak var welcomeUserLabel: UILabel!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeUserLabel.text = "Welcome, \(welcomeUser!)"
        initGradient()
    }
    
    // MARK: - IB Action
    @IBAction func cancelAction(_ sender: UIButton) {
    }
    
    // MARK: - Private methods
    private func initGradient() {
        let colors = Colors()
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
}
