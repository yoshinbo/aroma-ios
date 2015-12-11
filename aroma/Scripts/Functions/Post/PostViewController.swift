//
//  PostViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/10/28.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

protocol PostViewControllerDelegate {
    func closeKeyboard()
    func updateKeyboardNavigation(string: String, color: UIColor)
    func showIngredientCreator(name: String, amount: Int)
    func showInputTextView(string: String)
    func showCategorySelector(id: Int)
}

class PostViewController: UIViewController {
    
    struct Const {
        static let maxDescriptionLength = 300
        static let keyboardNavigationHeight: CGFloat = 30
    }

    class func build() -> (UINavigationController, PostViewController) {
        let navigationController = UIStoryboard(name: "Post", bundle: nil).instantiateInitialViewController() as! UINavigationController
        let viewController = navigationController.topViewController as! PostViewController
        return (navigationController, viewController)
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var keyboardNavigationLabel: UILabel!
    @IBOutlet weak var keyboardNavigationButton: UIButton!
    @IBOutlet weak var keyboardNavigationHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var keyboardNavigationBottomConstraint: NSLayoutConstraint!

    private var dataHandler: PostDataHandler!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.tintColor = AppColorRed

        dataHandler = PostDataHandler()
        dataHandler.setup(tableView)
        dataHandler.delegate = self
        hideKeyboardNavigation()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willShowKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willHideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(animated: Bool) {
        self.view.endEditing(true)
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }

    @IBAction func onTapCloseButton(sender: UIBarButtonItem) {
        closeViewController()
    }

    @IBAction func touchUpInsideKeyboardNavigationDoneButton(sender: AnyObject) {
        self.view.endEditing(true)
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

extension PostViewController {
    func showKeyboardNavigation() {
        keyboardNavigationButton.hidden = false
        keyboardNavigationHeightConstraint.constant = Const.keyboardNavigationHeight
    }

    func hideKeyboardNavigation() {
        keyboardNavigationButton.hidden = true
        keyboardNavigationHeightConstraint.constant = 0
    }
}

extension PostViewController: PostViewControllerDelegate {
    func updateKeyboardNavigation(string: String, color: UIColor) {
        keyboardNavigationLabel.textColor = color
        keyboardNavigationLabel.text = string
    }

    func closeKeyboard() {
        self.view.endEditing(true)
    }

    func showIngredientCreator(name: String, amount: Int) {
        let (_, viewController) = IngredientCreatorViewController.build()
        viewController.configure(name, amount: amount)
        viewController.delegate = dataHandler
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showInputTextView(string: String) {
        let (_, viewController) = InputTextViewController.build()
        viewController.configure(string, placeholder: localizedString("descriptionPlaceholder"), max: Const.maxDescriptionLength, completion: dataHandler.setDescription)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showCategorySelector(id: Int) {
        let viewController = CategorySelectorViewController.build()
        viewController.postDelegate = dataHandler
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
