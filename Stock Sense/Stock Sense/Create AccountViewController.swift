//
//  Create AccountViewController.swift
//  Stock Sense
//
//  Created by Ananya Adiki on 1/27/24.
//

import UIKit

class Create_AccountViewController: UIViewController {

    @IBOutlet var newUsernameTextField: UITextField!
    @IBOutlet var newPasswordTextField: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var accountCreatedLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        newPasswordTextField.isHidden = true
        passwordLabel.isHidden = true
        accountCreatedLabel.isHidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newUsernameAction(_ sender: Any) {
        newPasswordTextField.isHidden = false
        passwordLabel.isHidden = false
        
    }
    
    @IBAction func newPasswordAction(_ sender: Any) {
        if let newUser = newUsernameTextField.text, let newPass = newPasswordTextField.text{
            defaults.set(newPass, forKey: newUser)
            accountCreatedLabel.isHidden = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let createVC = segue.destination as! Gather_Data
        createVC.userName = newUsernameTextField.text!
        let VC = segue.destination as! My_Profile_ViewController
        VC.username = newUsernameTextField.text!
        let VC2 = segue.destination as! My_Stocks_View_Controller
        VC2.user = newUsernameTextField.text!

                    
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
