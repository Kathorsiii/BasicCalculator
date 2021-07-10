//
//  ViewController.swift
//  BasicCalculator
//
//  Created by macos on 7/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtOne: UITextField!
    @IBOutlet weak var txtTwo: UITextField!
    @IBOutlet weak var txtResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // For setting up the numpad title
        setupNumpadFields()
        
        txtOne.keyboardType = UIKeyboardType.numberPad
        txtTwo.keyboardType = UIKeyboardType.numberPad

        // To dismiss the keyboard on tap
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @IBAction func btnAdd(_ sender: Any) {
        let numOne = Int(txtOne.text!)!
        let numTwo = Int(txtTwo.text!)!
        txtResult.text = String(numOne + numTwo)
    }
    
    @IBAction func btnSub(_ sender: Any) {
        let numOne = Int(txtOne.text!)!
        let numTwo = Int(txtTwo.text!)!
        txtResult.text = String(numOne - numTwo)
    }
    
    @IBAction func btnMul(_ sender: Any) {
        let numOne = Int(txtOne.text!)!
        let numTwo = Int(txtTwo.text!)!
        txtResult.text = String(numOne * numTwo)
    }
    
    @IBAction func btnDiv(_ sender: Any) {
        let numOne = Int(txtOne.text!)!
        let numTwo = Int(txtTwo.text!)!
        txtResult.text = String(numOne / numTwo)
    }
    
    // To dismiss the keyboard on tap
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // To add title in numpad
    func setupNumpadFields() {
        let toolbar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(btnDoneTapped))
            
        toolbar.setItems([flexibleSpace, btnDone], animated: true)
        toolbar.sizeToFit()
            
        txtOne.inputAccessoryView = toolbar
        txtTwo.inputAccessoryView = toolbar
    }
        
    @objc func btnDoneTapped() {
        view.endEditing(true)
    }
    
}

