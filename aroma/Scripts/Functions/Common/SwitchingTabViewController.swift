//
//  SwitchingTabViewController.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/03.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import UIKit

class SwitchingTabViewController: UIViewController {

    private struct Const {
        static let buttonTag = 100
        static let font = UIFont.systemFontOfSize(14)
        static let boldFont = UIFont.boldSystemFontOfSize(14)
    }
    @IBOutlet weak var headerView: SwitchingHeaderView!
    @IBOutlet weak var scrollView: UIScrollView!

    var viewControllers: [UIViewController]!
    var selectedIndex = 0 {
        didSet {
            if selectedIndex != oldValue {
                viewControllers[oldValue].willMoveToParentViewController(nil)
                viewControllers[oldValue].beginAppearanceTransition(false, animated: false)
                viewControllers[oldValue].removeFromParentViewController()
                viewControllers[oldValue].endAppearanceTransition()

                addChildViewController(viewControllers[selectedIndex])

                viewControllers[selectedIndex].beginAppearanceTransition(true, animated: false)
                viewControllers[selectedIndex].didMoveToParentViewController(self)
                viewControllers[selectedIndex].endAppearanceTransition()
            }
        }
    }
    var selectedViewController: UIViewController {
        return viewControllers[selectedIndex]
    }

    func setSwitchingTabViewControllers(controllers: [UIViewController]) {
        viewControllers = controllers
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHeaderView()
        setupScrollView()
        updateButtonState()
        scrollView.scrollsToTop = false
        addChildViewController(viewControllers[selectedIndex])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewControllers.count), height: scrollView.frame.height)
        view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onTouchUpInsideHeaderButton(button: UIButton) {
        let i = button.tag - Const.buttonTag
        scrollView.setContentOffset(CGPoint(x: CGFloat(i) * scrollView.frame.width, y: 0), animated: true)
        selectedIndex = i
        updateButtonState()
    }
}

extension SwitchingTabViewController {
    private func setupHeaderView() {
        var i = 0
        for vc in viewControllers {
            let b = UIButton()
            b.setTitle(vc.title, forState: .Normal)
            b.setTitleColor(AppColorLightGray, forState: .Normal)
            b.setTitleColor(AppColorRed, forState: .Selected)
            b.addTarget(self, action: "onTouchUpInsideHeaderButton:", forControlEvents: .TouchUpInside)
            b.titleLabel?.font = Const.font
            b.tag = i + Const.buttonTag

            headerView.addSubview(b)
            i++
        }
    }

    private func setupScrollView() {
        var i = 0
        for vc in viewControllers {
            vc.view.frame = CGRect(x: CGFloat(i*Int(scrollView.frame.width)), y:0, width: scrollView.frame.width, height: scrollView.frame.height)
            vc.view.autoresizingMask = [
                .FlexibleWidth,
                .FlexibleHeight,
                .FlexibleRightMargin,
                .FlexibleLeftMargin,
                .FlexibleTopMargin,
                .FlexibleBottomMargin
            ]
            scrollView.addSubview(vc.view)
            i++
        }

        scrollView.pagingEnabled = true
        scrollView.delegate = self
    }

    private func updateButtonState() {
        for i in (0..<viewControllers.count) {
            if let b = headerView.viewWithTag(i+Const.buttonTag) as? UIButton {
                b.selected = i == selectedIndex
                b.titleLabel?.font = b.selected ? Const.boldFont : Const.font
            }
        }
    }
}

extension SwitchingTabViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let width = scrollView.contentSize.width - scrollView.frame.width
        let x = scrollView.contentOffset.x
        var rate = x / width

        if rate < 0 { rate = 0 }
        if rate > 1 { rate = 1 }

        headerView.setBorderOffset(rate)
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        selectedIndex = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        updateButtonState()
    }
}
