//
//  InputTextViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/18.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class InputTextViewController: UIViewController {

    struct Const {
        static let keyboardNavigationHeight: CGFloat = 30
        static let format = "%d / %d"
    }

    class func build() -> InputTextViewController {
        return UIStoryboard(name: "InputTextView", bundle: nil).instantiateInitialViewController() as! InputTextViewController
    }

    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var keyboardNavigationLabel: UILabel!
    @IBOutlet weak var keyboardNavigationBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var keyboardNavigationHeightConstraint: NSLayoutConstraint!

    var string = ""
    var placeholder = ""
    var max: Int = 0
    var completion: ((string: String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.tintColor = AppColorRed

        if string == "" {
            placeholderLabel.text = placeholder
        } else {
            placeholderLabel.hidden = true
            textView.text = string
        }
        keyboardNavigationLabel.text = String(format: Const.format, textView.text.characters.count, max)
        keyboardNavigationLabel.textColor = AppColorStringS
        textView.delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willShowKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willHideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidDisappear(animated: Bool) {
        completion?(string: textView.text)
        super.viewDidDisappear(animated)
    }

    func configure(string: String, placeholder: String, max: Int, completion: ((string: String) -> Void)) {
        self.string = string
        self.placeholder = placeholder
        self.max = max
        self.completion = completion
    }

    func willShowKeyboard(notification: NSNotification) {
        if let userInfo = notification.userInfo{
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
                let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))

                showKeyboardNavigation()
                UIView.animateWithDuration(duration, delay: 0.0, options: options, animations: {
                    () -> Void in
                    self.keyboardNavigationBottomConstraint.constant = keyboard.CGRectValue().size.height
                    self.view.layoutIfNeeded()
                    }, completion: nil)
            }
        }
    }

    func willHideKeyboard(notification: NSNotification) {
        if let userInfo = notification.userInfo{
            if let _ = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
                let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))

                hideKeyboardNavigation()
                UIView.animateWithDuration(duration, delay: 0.0, options: options, animations: {
                    () -> Void in
                    self.keyboardNavigationBottomConstraint.constant = 0
                    self.view.layoutIfNeeded()
                    }, completion: nil)
            }
        }
    }
}

extension InputTextViewController {
    func showKeyboardNavigation() {
        keyboardNavigationHeightConstraint.constant = Const.keyboardNavigationHeight
    }

    func hideKeyboardNavigation() {
        keyboardNavigationHeightConstraint.constant = 0
    }
}

extension InputTextViewController: UITextViewDelegate {
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let count = (textView.text.characters.count - range.length) + text.characters.count
        if 0 < count && count <= max {
            keyboardNavigationLabel.textColor = AppColorStringS
            //let newtext = NSString(string: textView.text!).stringByReplacingCharactersInRange(range, withString: text)
            //navigationItem.setHidesBackButton(false, animated: true)
        } else {
            keyboardNavigationLabel.textColor = AppColorRed
            //navigationItem.setHidesBackButton(true, animated: true)
        }
        keyboardNavigationLabel.text = String(format: Const.format, count, max)
        return true
    }

    func textViewDidBeginEditing(textView: UITextView) {
        placeholderLabel.hidden = true
        keyboardNavigationLabel.text = String(format: Const.format, textView.text.characters.count, max)
    }

    func textViewDidEndEditing(textView: UITextView) {
        if 0 >= textView.text.characters.count {
            placeholderLabel.hidden = false
        }
    }
}
