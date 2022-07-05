//
//  ViewController.swift
//  reverse
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTextFieldOutlet: UITextField!
    var sentence = ""//words to reverse
    
    @IBOutlet weak var buttonOutlet: UIButton!
    var text = false
    
    var word = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTextFieldOutlet.delegate = self
        mainTextFieldOutlet.borderStyle = UITextField.BorderStyle.none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: mainTextFieldOutlet.frame.height - 1, width: mainTextFieldOutlet.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        mainTextFieldOutlet.layer.addSublayer(bottomLine)
        

    }
    
    @IBAction func buttonAction(_ sender: Any) {
        text.toggle()
        if !text{
            buttonOutlet.setTitle("Reverse", for: .normal)
            mainTextFieldOutlet.text = ""
            word.text = ""
        }
        else{
            buttonOutlet.setTitle("Clear", for: .normal)
            view.addSubview(word)
            word.frame = CGRect(x: 10, y: 500, width: 350, height: 40)
            word.textAlignment = .left
            word.font = .systemFont(ofSize: 24)
            word.text = String(sentence.components(separatedBy: " ").map({
                $0.reversed()
            }).joined(separator: " "))
            word.textColor = UIColor(red: 0/256, green: 122/256, blue: 255/256, alpha: 1)
        }
        
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == mainTextFieldOutlet{
            sentence = textField.text!
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == mainTextFieldOutlet{
            mainTextFieldOutlet.resignFirstResponder()
        }
        return true
    }
}
