//
//  CommentButton.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/01.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

@IBDesignable
class CommentButton: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    var delegate: TimeLineViewControllerDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }

    @IBAction func touchUpInside(sender: UIButton) {
        delegate?.showRecipeDetailView()
    }
}

extension CommentButton {
    private func build() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CommentButton", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false
        let bindings = ["view": view]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|",
            options:NSLayoutFormatOptions(rawValue: 0),
            metrics:nil,
            views: bindings))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[view]|",
            options:NSLayoutFormatOptions(rawValue: 0),
            metrics:nil,
            views: bindings))

        connerLittleRound()
    }
}
