//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Rahul Shah on 12/17/16.
//  Copyright © 2016 Rahul Shah. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate
{
    @IBOutlet var celciusLabel:UILabel!
    @IBOutlet var textField:UITextField!
    var fahrenheitValue: Double?
    {
        didSet{
            updateCelciusLabel()
        }
    }
    
    var celciusValue: Double?
    {
        if let value = fahrenheitValue
        {
            return (value - 32) * (5/9)
        }
        else{
            return nil
        }
    }
    
    @IBAction func farenheitFieldEditingChanged(textField:UITextField)
    {
        if let text = textField.text, let number = numberFormatter.number(from: text){
            fahrenheitValue = number.doubleValue
        }
        else{
            fahrenheitValue = nil
        }
        
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject)
    {
        textField.resignFirstResponder()
    }
    
    func updateCelciusLabel()
    {
        if let value = celciusValue{
            celciusLabel.text = numberFormatter.string(from: NSNumber.init(value: value))
        }
        else{
            celciusLabel.text = "???"
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentLocale = NSLocale.current
        let decimalSeperator = currentLocale.decimalSeparator
        
        let existingTextHasDecimalSeperator = textField.text?.range(of: decimalSeperator!)
        let replacementTextHasDecimalSeperator = string.range(of: decimalSeperator!)
        
        let replacementTextHasAlphabet = string.rangeOfCharacter(from: NSCharacterSet.letters)
        
        if existingTextHasDecimalSeperator != nil && replacementTextHasDecimalSeperator != nil
        {
            return false
        }
        if replacementTextHasAlphabet != nil
        {
            return false;
        }
        else{
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let date = NSDate()
        let calendar = NSCalendar.current
        let hour = calendar.component(.hour, from: date as Date)
        let minutes = calendar.component(.minute, from: date as Date)
        if hour > 14
        {
            view.backgroundColor = UIColor.yellow
        }
        
    }
}
