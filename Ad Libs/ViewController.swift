//
//  ViewController.swift
//  Ad Libs
//
//  Created by Joshua Cox on 9/15/15.
//  Copyright (c) 2015 Joshua Cox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var pastTenseVerbTextField: UITextField!
	@IBOutlet weak var singularNounTextField: UITextField!
	@IBOutlet weak var pluralNounTextField: UITextField!
	@IBOutlet weak var phraseTextField: UITextField!
	var textFields = [UITextField]()
	
	@IBOutlet weak var placeSegButton: UISegmentedControl!
	@IBOutlet weak var libsTextView: UITextView!
	@IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var numberSliderValue: UISlider!
	
	@IBAction func numberSlider(sender: AnyObject) {
		numberLabel.text = "\(Int(numberSliderValue.value))"
	}
	
	var place = ""
	@IBAction func createLibs(sender: AnyObject) {
		switch placeSegButton.selectedSegmentIndex {
		case 0:
			place = "zoo"
		case 1:
			place = "home"
		case 2:
			place = "library"
		default:
			place = "somewhere"
		}

		let adlib = "Once upon a time, there was a \(singularNounTextField.text!) roaming around a \(place). It \(pastTenseVerbTextField.text!) until it was so tired, it collapsed onto \(numberLabel.text!) \(pluralNounTextField.text!), and then shouted, \"\(phraseTextField.text!)!\" \n\n The end. "
		
		libsTextView.text = adlib
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		numberLabel.text = "\(Int(numberSliderValue.value))"
		
		textFields = [pastTenseVerbTextField, singularNounTextField,
		 							pluralNounTextField, phraseTextField]
		for field in textFields { field.delegate = self }
	}

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		let index = find(textFields, textField)
		textField.resignFirstResponder()
		
		if index < textFields.count - 1 {
			textFields[index! + 1].becomeFirstResponder()
		}
		
		return true
	}
}

