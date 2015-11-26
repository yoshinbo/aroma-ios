//
//  RecipeLabel.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/08.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class RecipeLabel: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    private var image = UIImage(named: "label")?.imageWithRenderingMode(.AlwaysTemplate)

    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }

    func configure(label: String, color: UIColor) {
        imageView.tintColor = color
        self.label.text = label
    }
}

extension RecipeLabel {
    private func build() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "RecipeLabel", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        addSubview(view)
        imageView.image = image

        // カスタムViewのサイズを自分自身と同じサイズにする
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
    }
}
