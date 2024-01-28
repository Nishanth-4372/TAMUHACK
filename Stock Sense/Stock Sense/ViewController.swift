//
//  ViewController.swift
//  Stock Sense
//
//  Created by Ananya Adiki on 1/27/24.
//

import UIKit

class ViewController: UIViewController {
    var user: String = ""
    let defaults = UserDefaults.standard
    @IBOutlet var wrongLoginLabel: UILabel!
    @IBOutlet var usernameTextfield: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        wrongLoginLabel.isHidden = true
        usernameTextfield.text = ""
        passwordTextfield.text = ""
        
        

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var label: UILabel!

    override func loadView() {
        super.loadView()

        // This is the key
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClicLabel(sender:)))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
    }

    // And that's the function :)
    @objc func onClicLabel(sender:UITapGestureRecognizer) {
        openUrl(urlString: "https://docs.google.com/document/d/1rt3FDy6UBBrLp71zwxGbG7w6s3KixdGYWVqZiUCzfpY/edit?usp=sharing")
    }


    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    
    @IBOutlet var createAccountButton: UIButton!
    @IBAction func createAccountSegue(_ sender: Any) {
        performSegue(withIdentifier: "createAcc", sender: createAccountButton)
    }
    
    @IBAction func checkLogin(_ sender: Any) {
        print(UserDefaults.standard.dictionaryRepresentation())
        user = usernameTextfield.text!
        if usernameTextfield.text!.isEmpty || passwordTextfield.text!.isEmpty{
            wrongLoginLabel.isHidden = false
            
        }else{
            if defaults.value(forKey: user) as? String  == passwordTextfield.text{
                
                wrongLoginLabel.isHidden = true
              if defaults.value(forKey: "\(user) Savings") != nil {
                  performSegue(withIdentifier: "mydatascreen", sender: loginButton)
             }else{
              
                   performSegue(withIdentifier: "gatherdatascreen", sender: loginButton)
            }
                
            }else{
                wrongLoginLabel.isHidden = false
            }
        }
       
    }
    
    
@IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
       let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
}
    
    
}

