//
//  Gather Data.swift
//  Stock Sense
//
//  Created by Ananya Adiki on 1/27/24.
//

import UIKit

class Gather_Data: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
   
    let defaults = UserDefaults.standard
    @IBOutlet var userIncome: UITextField!
    @IBOutlet var userExpenses: UITextField!
    @IBOutlet var userSavings: UITextField!
    @IBOutlet var getStartedButton: UIButton!
    @IBOutlet var userInvestments: UITextField!
    @IBOutlet var sector1: UIPickerView!
    @IBOutlet var sector2: UIPickerView!
    @IBOutlet var sector3: UIPickerView!
    var pickerData: [String] = [String]()
    var userName: String = ""
    var titleOfC1: String? = ""
    var titleOfC2: String? = ""
    var titleOfC3: String? = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return pickerData[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sector1.delegate = self
        self.sector1.dataSource = self
        self.sector2.delegate = self
        self.sector2.dataSource = self
        self.sector3.delegate = self
        self.sector3.dataSource = self
        pickerData = ["Information Technology", "Energy", "Materials", "Industrials", "Utilities", "Healthcare", "Financials", "Real Estate", "Communication Services", "Consumer Staples", "Consumer Discretionary"]

        
    }
    
    
    @IBAction func getStartedAction(_ sender: Any) {
        performSegue(withIdentifier: "homescreen", sender: getStartedButton)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let category1 = sector1.selectedRow(inComponent: 0)
        titleOfC1 = sector1.delegate?.pickerView?(sector1, titleForRow: category1, forComponent: 0)
        let category2 = sector2.selectedRow(inComponent: 0)
        titleOfC2 = sector2.delegate?.pickerView?(sector2, titleForRow: category2, forComponent: 0)
        let category3 = sector3.selectedRow(inComponent: 0)
        titleOfC3 = sector3.delegate?.pickerView?(sector3, titleForRow: category3, forComponent: 0)
       
        defaults.set(userIncome.text!, forKey: "\(userName) Income")
        defaults.set(userExpenses.text!, forKey: "\(userName) Expenses")
        defaults.set(userSavings.text!, forKey: "\(userName) Savings")
        defaults.set(userInvestments.text!, forKey: "\(userName) Investment")
        defaults.set(userInvestments.text!, forKey: "Final Investment")
        defaults.set("\(titleOfC1!)", forKey: "\(userName) sector1")
        defaults.set("\(titleOfC2!)", forKey: "\(userName) sector2")
        defaults.set("\(titleOfC3!)", forKey: "\(userName) sector3")
        

        
        
    }
}
    
    


