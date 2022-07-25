//
//  ReverseViewController.swift
//  reverse
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController {

    @IBOutlet weak private var inputTextField: UITextField!
    @IBOutlet weak private var exclusionTextField: UITextField!
    @IBOutlet weak private var button: UIButton!
    @IBOutlet weak private var reversedLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var segmentedControl: UISegmentedControl!
    
    //words to reverse
    private var sentence = "" 
    
    private var isReversed = false {
        didSet {
            if isReversed {
                button.setTitle("Clear", for: .normal)
            } else {
                button.setTitle("Reverse", for: .normal)
            }
        }
        
    }
    
    private var exceptionalCharacters = ""
    private lazy var textReverseManager = TextReverseManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reversedLabel.text = ""
        button.isEnabled = false
        inputTextField.delegate = self
        exclusionTextField.delegate = self
        exclusionTextField.isHidden = true
        inputTextField.borderStyle = UITextField.BorderStyle.none
        exclusionTextField.borderStyle = UITextField.BorderStyle.none
    }
    
    @IBAction func buttonTapped() {
        isReversed.toggle()
        if isReversed {
            guard let inputText = inputTextField.text else { return }
            guard let exceptions = exclusionTextField.text else { return }
            sentence = inputText
            if segmentedControl.selectedSegmentIndex == 0 {
                reversedLabel.text = textReverseManager.reversedText(sentence: sentence)
            } else {
                reversedLabel.text = textReverseManager.reversedTextWithExclusions(phrase: sentence, ignoredCharacters: exceptions)
            }
        } else {
            button.isEnabled.toggle()
            inputTextField.text = ""
            reversedLabel.text = ""
        }
    }
    
    @IBAction func segmentControlIndexChanged() {
        isReversed = false
        reversedLabel.text = ""
        descriptionLabel.isHidden.toggle()
        exclusionTextField.isHidden.toggle()
    }
    
    @IBAction func textFieldEditing(_ sender: UITextField) {
        if sender.text?.count ?? 0 > 0 {
            button.isEnabled = true
        } else {
            button.isEnabled = false
        }
    }
}

extension ReverseWordsViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing() -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == inputTextField {
            guard let inputText = textField.text else { return }
            sentence = inputText
            button.isEnabled = !sentence.isEmpty
        } else if textField == exclusionTextField {
            guard let exceptionText = textField.text else { return }
            exceptionalCharacters = exceptionText
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == inputTextField {
            button.isEnabled = true
            if isReversed {
                isReversed.toggle()
            }
        } else if textField == exclusionTextField && inputTextField.text != "" {
            button.isEnabled = true
            if isReversed {
                isReversed.toggle()
            }
        }
        return true
    }
}

