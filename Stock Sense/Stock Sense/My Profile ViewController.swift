//
//  My Profile ViewController.swift
//  Stock Sense
//
//  Created by Ananya Adiki on 1/27/24.
//

import UIKit

class My_Profile_ViewController: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet var investment: UILabel!
    @IBOutlet var savings: UILabel!
    @IBOutlet var expenses: UILabel!
    @IBOutlet var income: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet var editLabel: UIButton!
    
    var techsector: [String: [String:Float]] = ["Broadcom Inc.": ["AVGO" : 40.91011820352316], "ASML Holding N.V.": ["ASML": 31.28433075000002], "Lam Research Corporation": ["LRCX": 30.219205927559717], "ServiceNow Inc.": ["NOW": 27.23675025000001], "Adobe Inc.": ["ADBE": 23.573599213119884], "Intuit Inc.": ["INTU": 23.554737749999997], "KLA Corporation": ["KLAC": 22.523646057138368], "Synopsys Inc.": ["SNPS": 21.209531808691835]]
    
/*/, "NVIDIA Corporation": ["NVDA", 19.915492500000006], "Microsoft Corporation": ["MSFT", 15.621108375], "Accenture plc": ["ACN", 14.396119500000006], "Palo Alto Networks Inc.": ["PANW", 11.48617094221899], "Cadence Design Systems Inc.": ["CDNS", 11.060119318990157], "Salesforce Inc.": ["CRM", 10.28713907 6810728], "Arista Networks Inc.": ["ANET", 8.768379639171403], "Analog Devices Inc.": ["ADI", 8.384366177494346], "Apple Inc.": ["AAPL", 8.297627641990465], "Texas Instruments Incorporated": ["TXN", 7.531600053291193], "International Business Machines Corporation": ["IBM", 6.599864625000002], "SAP SE": ["SAP", 6.465153750000002], "Applied Materials Inc.": ["AMAT", 6.464042679372318], "QUALCOMM Incorporated": ["QCOM", 5.631762201763489], "Advanced Micro Devices Inc.": ["AMD", 5.4276707742121335], "Oracle Corporation": ["ORCL", 4.943695456832249], "Taiwan Semiconductor Manufacturing Company Limited": ["TSM", 4.40176205490783], "Sony Group Corporation": ["SONY", 4.112157311937645], "Micron Technology Inc.": ["MU", 3.255724720183487], "Shopify Inc.": ["SHOP", 2.9632709355377083], "Cisco Systems Inc.": ["CSCO", 2.2926761568026244], "Uber Technologies Inc.": ["UBER", 2.225264250000001], "Intel Corporation": ["INTC", 1.738014250238961], "Infosys Limited": ["INFY", 0.7876531276171488]]*/
    
   /* @IBAction func logOut(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }*/
    var score: Float = 0.0
    var username: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        income.text = defaults.value(forKey: "\(username) Income") as? String
        expenses.text = defaults.value(forKey: "\(username) Expenses") as? String
        savings.text = defaults.value(forKey: "\(username) Savings") as? String
        investment.text = defaults.value(forKey: "\(username) Investment") as? String
       
        // Convert string values to Float
        if let incomeValue = Float(income.text!),
           let expensesValue = Float(expenses.text!),
           let savingsValue = Float(savings.text!),
           let investmentValue = Float(investment.text!) {

                    scoreLabel.text = "\(scoreFunc(income: incomeValue, user_expenses: expensesValue, user_savings: savingsValue, user_investment: investmentValue))"
                    }
    }
    
    @IBAction func editAction(_ sender: Any) {
        performSegue(withIdentifier: "editValues", sender: editLabel)
    }
    
    
    func scoreFunc(income: Float, user_expenses: Float, user_savings: Float, user_investment:Float) -> Int{
            var exp: Float = 0.0
            var sav: Float = 0.0
            var inv: Float = 0.0
        if (income < 50000/12){
            exp = income * 0.85
            sav = income * 0.1
            inv = income * 0.05
        }
        else if (income < 140000/12){
            exp = income * 0.80
            sav = income * 0.1
            inv = income * 0.1
        }
        else if (income < 320000/12){
            exp = income * 0.70
            sav = income * 0.15
            inv = income * 0.15
        }
        else if (income > 320000/12){
            exp = income * 0.60
            sav = income * 0.20
            inv = income * 0.20
        }
        score = 100.0
        if (user_expenses > Float(exp)){
            score -= (user_expenses - exp) * 0.02
        }
        if score<0 || income < (user_expenses + user_savings + user_investment){
            score = 0
        }
        return Int(score)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        defaults.set(investment.text!, forKey: "Final Investment")
    }*/

    
 
}
