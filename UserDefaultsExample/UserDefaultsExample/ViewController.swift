//
//  ViewController.swift
//  UserDefaultsExample
//
//  Created by Asad Ullah on 23/01/2023.
//

import UIKit
import GenericUserDefaults

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        show(alert, sender: self)
        //view.layer.cornerRadius = 12
    }
    
    // Retrive value if already added
    @IBAction func btnRetriveAction(_ sender: UIButton) {
        if let hasSeenAppIntroduction = UserDefaults.hasSeenAppIntroduction, hasSeenAppIntroduction {
            showAlert("UserDefaults wrapper", "App introduction screens already seen")
        } else {
            showAlert("UserDefaults wrapper", "No Value found")
        }
        
    }
    
    // Save value in UserDefaults
    @IBAction func btnSaveAction(_ sender: UIButton) {
        
        UserDefaults.hasSeenAppIntroduction = true
        showAlert("UserDefaults wrapper", "App introduction screens Viewed")
    }
    
    // Delete value in UserDefaults
    @IBAction func btnDeleteAction(_ sender: UIButton) {
        UserDefaults.hasSeenAppIntroduction = nil
        showAlert("UserDefaults wrapper", "Value removed from UserDefaults")
    }
}


extension UserDefaults {
    @UserDefault(key: "has_seen_app_introduction", defaultValue: false)
    static var hasSeenAppIntroduction: Bool?
}

