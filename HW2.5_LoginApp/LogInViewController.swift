//
//  LogInViewController.swift
//  HW2.5_LoginApp
//
//  Created by Наталья Мирная on 08.04.2020.
//  Copyright © 2020 Наталья Мирная. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    // MARK: Private propeties
    private let user = User.init(userName: "User", password: "Password")
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.delegate = self
        passwordLabel.delegate = self
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        guard usernameLabel.text == user.userName, passwordLabel.text == user.password else {
            alertForTips(title: "Invalid login or password", message: "Show tips", textField: passwordLabel)
            return
        }
        super.performSegue(withIdentifier: identifier, sender: sender)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.welcomeUser = usernameLabel.text
    }
    
    // MARK: - IB Actions
    @IBAction func loginAction(_ sender: UIButton) {
        performSegue(withIdentifier: "identifier", sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue){
        usernameLabel.text = nil
        passwordLabel.text = nil
    }
    
    @IBAction func forgotUNAction(_ sender: UIButton) {
        alertForTips(title: "Forgot username?", message: "Your username is \(user.userName)!")
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        alertForTips(title: "Forgot password?", message: "Your password is \(user.password)!")
    }
    
    // MARK: - Public methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        view.endEditing(true)
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            performSegue(withIdentifier: "identifier", sender: nil)
        }
        return true
    }
}

extension LogInViewController {
    private func alertForTips(title: String, message: String, textField: UITextField? = nil ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "OK", style: .default)
        textField?.text = nil
        alert.addAction(OkAction)
        present(alert, animated: true, completion: nil)
    }
}

