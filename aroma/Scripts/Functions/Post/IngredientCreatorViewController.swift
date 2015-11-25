//
//  IngredientCreatorViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/14.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class IngredientCreatorViewController: UIViewController {

    struct Const {
        static let nameInputMaxLength: Int = 30
        static let amountInputMaxLength: Int = 2
    }

    class func build() -> (UINavigationController, IngredientCreatorViewController) {
        let navigationController = UIStoryboard(name: "Post", bundle: nil).instantiateViewControllerWithIdentifier("ingredientCreator") as! UINavigationController
        let viewController = navigationController.topViewController as! IngredientCreatorViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!

    var delegate: PostDataHandlerDelegate?
    var name: String!
    var amount: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.tintColor = AppColorRed
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tapUpInsideScreen:"))

        nameTextField.text = name
        nameTextField.delegate = self
        amountTextField.text = "\(amount)"
        amountTextField.delegate = self
        amountTextField.keyboardType = .NumberPad

        updateDoneButtonState(nameTextField.text!, amount: amountTextField.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configure(name: String, amount: Int) {
        self.name = name
        self.amount = amount
    }

    func tapUpInsideScreen(recognizer: UIPanGestureRecognizer) {
        self.view.endEditing(true)
    }

    @IBAction func tapUpInsideDoneButton(sender: UIBarButtonItem) {
        delegate?.insertIngredientContainer(nameTextField.text!, amount: Int(amountTextField.text!)!)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

extension IngredientCreatorViewController {
    func updateDoneButtonState(name: String, amount: String) {
        if name != "" && amount != "" {
            if let _amount: Int = Int(amount) {
                if _amount > 0 {
                    doneButton.enabled = true
                    return
                }
            }
        }
        doneButton.enabled = false
    }
}

extension IngredientCreatorViewController: UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var trimText = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        let textCount = trimText.characters.count
        trimText = trimText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())

        let maxInputLength = textField == nameTextField ? Const.nameInputMaxLength : Const.amountInputMaxLength
        if textCount > maxInputLength {
            textField.text = trimText.substringToIndex(trimText.startIndex.advancedBy(maxInputLength))
            return false
        }
        let newtext = NSString(string: textField.text!).stringByReplacingCharactersInRange(range, withString: string)
        let (_name, _amount) = textField == nameTextField ? (newtext, amountTextField.text!) : (nameTextField.text!, newtext)
        updateDoneButtonState(_name, amount: _amount)
        navigationItem.setHidesBackButton(false, animated: true)
        return true
    }

    func textFieldDidEndEditing(textField: UITextField) {
        updateDoneButtonState(nameTextField.text!, amount: amountTextField.text!)
    }
}
