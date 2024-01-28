//
//  Report View Controller.swift
//  Stock Sense
//
//  Created by Ananya Adiki on 1/27/24.
//

import UIKit

class Report_View_Controller: UIViewController {
    
    let defaults = UserDefaults.standard
    @IBOutlet var s2: UILabel!
    @IBOutlet var s1: UILabel!
    @IBOutlet var s3: UILabel!

    @IBOutlet var share1: UILabel!
    @IBOutlet var share2: UILabel!
    @IBOutlet var share3: UILabel!
    
    var investmentAmt: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        s1.text =  "Broadcom Inc."
        s2.text =  "Chevron Corporatio"
        s3.text =  "Regeneron Pharmaceuticals Inc."
        investmentAmt =  (defaults.value(forKey: "Final Investment") as? String)!
        
        share1.text = "\(Int(Double(investmentAmt)! / 1204.88))"
        share2.text = "\(Int(Double(investmentAmt)!/149.14))"
        share3.text = "\(Int(Double(investmentAmt)!/940.05))"
    }
   
        
    }
    
