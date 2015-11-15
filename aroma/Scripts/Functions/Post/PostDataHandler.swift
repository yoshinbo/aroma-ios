//
//  PostDataHandler.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2015/11/08.
//  Copyright © 2015年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import UIKit

protocol PostDataHandlerDelegate {
    func insertIngredientContainer(name: String, amount: Int)
    func setCategory(id: Int, name: String)
    func tableEdit(on: Bool)
}

class PostDataHandler: NSObject {

    struct Const {
        static let editableSectionIndex = 3
        static let categorySectionIndexPath = NSIndexPath(forRow: 0, inSection: 1)
        static let sections = [
            [
                [ "id": "title", "class": "PostTextViewCell"],
                [ "id": "description", "class": "PostTextViewCell"],
            ],
            [
                [ "id": "category", "class": "PostIndexCell"],
            ],
            [
                [ "id": "ingredientHeader", "class": "PostIngredientHeaderCell"],
            ],
            [
                [ "id": "ingredient", "class": "PostIngredientCell"],
            ],
            [
                [ "id": "ingredientFooter", "class": "PostIngredientFooterCell"],
            ],
        ]
        static let sectionTitle = [
           localizedString("titleAndComment"),
           localizedString("recipe"),
        ]
        struct title {
            static let placeholder = localizedString("titlePlaceholder")
            static let maxLength: Int = 30
        }
        struct description {
            static let placeholder = localizedString("descriptionPlaceholder")
            static let maxLength: Int = 300
        }
    }

    class Ingredient {
        var name: String!
        var amount: Int!
        init(name: String, amount: Int) {
            self.name = name
            self.amount = amount
        }
        func isSame(name: String) -> Bool {
            return self.name == name
        }
    }

    var delegate: PostViewControllerDelegate?

    private weak var tableView: UITableView!
    private var ingredientContainer = [Ingredient]()
    private var ingredientHeaderCell: PostIngredientHeaderCell?
    private var categoryName = ""

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self

        initIngredientContainer()
    }

    func loadData() {
        tableView.reloadData()
    }

    func fetchData() {
    }
}

extension PostDataHandler {
    func cellData(indexPath: NSIndexPath) -> [String: String] {
        if Const.editableSectionIndex == indexPath.section {
            return Const.sections[indexPath.section][0]
        }
        return Const.sections[indexPath.section][indexPath.row]
    }

    func initIngredientContainer() {
       //ingredientContainer = [
       //     Ingredient.init(name: "ペパーミント", amount: 10),
       //     Ingredient.init(name: "ティートリー", amount: 10),
       //     Ingredient.init(name: "サイプレス", amount: 10),
       //]
    }
}

// MARK: - UITableViewDelegate
extension PostDataHandler: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let data = cellData(indexPath)
        switch data["id"]! as String {
        case "category":
            showCategorySelector(0)
        case "ingredient":
            let ingredient = ingredientContainer[indexPath.row]
            showIngredientCreator(ingredient.name, amount: ingredient.amount)
        case "ingredientFooter":
            showIngredientCreator("", amount: 0)
        default:
            break
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let data = cellData(indexPath)
        var height: CGFloat = 0
        switch data["id"]! as String {
        case "title":
            height = PostTextViewCell.height("あいうえおあいうえおあいうえおあいうえおあいうえおあいうえお") // 30文字分の高さを用意
        case "description":
            height = PostTextViewCell.height("あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお") // 150文字分の高さを用意
        case "category":
            height = PostIndexCell.height()
        case "ingredientHeader":
            height = PostIngredientHeaderCell.height()
        case "ingredient":
            height = PostIngredientCell.height()
        case "ingredientFooter":
            height = PostIngredientFooterCell.height()
        default:
            height = 0
        }
        return height
    }

    // NOTE: - IngredientCellの編集
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return Const.editableSectionIndex == indexPath.section
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        ingredientContainer.removeAtIndex(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return Const.editableSectionIndex == indexPath.section
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let ingredient = ingredientContainer[sourceIndexPath.row]
        ingredientContainer.removeAtIndex(sourceIndexPath.row)
        ingredientContainer.insert(ingredient, atIndex: destinationIndexPath.row)
    }

    func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        if Const.editableSectionIndex == proposedDestinationIndexPath.section {
            return proposedDestinationIndexPath
        } else if Const.editableSectionIndex < proposedDestinationIndexPath.section {
            return NSIndexPath(forRow: ingredientContainer.count - 1, inSection: Const.editableSectionIndex)
        } else {
            return NSIndexPath(forRow: 0, inSection: Const.editableSectionIndex)
        }
    }

    // NOTE: - 編集モード以外での削除はできないようにする
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return .Delete
        }
        return .None
    }
}

// MARK: - UITableViewDataSource
extension PostDataHandler: UITableViewDataSource {
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if Const.sectionTitle.count < section + 1 {
            return ""
        }
        return Const.sectionTitle[section]
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Const.sections.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Const.editableSectionIndex == section {
            return ingredientContainer.count
        }
        return Const.sections[section].count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let data = cellData(indexPath)
        var cell: UITableViewCell
        switch data["id"]! as String {
        case "title":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textViewCell") as! PostTextViewCell
            _cell.configure("", placeholder: Const.title.placeholder, maxInputLength: Const.title.maxLength)
            _cell.delegate = self
            cell = _cell
        case "description":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textViewCell") as! PostTextViewCell
            _cell.configure("", placeholder: Const.description.placeholder, maxInputLength: Const.description.maxLength)
            _cell.delegate = self
            cell = _cell
        case "category":
            let _cell = tableView.dequeueReusableCellWithIdentifier("indexCell") as! PostIndexCell
            let text = categoryName != "" ? categoryName : localizedString("required")
            _cell.configure(text)
            cell = _cell
        case "ingredientHeader":
            let _cell = tableView.dequeueReusableCellWithIdentifier("ingredientHeaderCell") as! PostIngredientHeaderCell
            _cell.delegate = self
            ingredientHeaderCell = _cell
            cell = _cell
        case "ingredient":
            let _cell = tableView.dequeueReusableCellWithIdentifier("ingredientCell") as! PostIngredientCell
            let ingredient = ingredientContainer[indexPath.row]
            _cell.configure(ingredient.name, amount: ingredient.amount)
            cell = _cell
        case "ingredientFooter":
            let _cell = tableView.dequeueReusableCellWithIdentifier("ingredientFooterCell") as! PostIngredientFooterCell
            cell = _cell
        default:
            cell = UITableViewCell()
        }
        return cell
    }
}

extension PostDataHandler: PostDataHandlerDelegate {
    func tableEdit(on: Bool) {
        tableView.setEditing(on, animated: true)
        closeKeyboard()
    }

    func insertIngredientContainer(name: String, amount: Int) {
        var hasEdit = false
        for ingredient in ingredientContainer {
            if ingredient.isSame(name) {
                ingredient.amount = amount
                hasEdit = true
            }
        }
        if !hasEdit {
            ingredientContainer.append(Ingredient.init(name: name, amount: amount))
        }
        tableView.reloadData()
    }

    func setCategory(id: Int, name: String) {
        if let _ = tableView.cellForRowAtIndexPath(Const.categorySectionIndexPath) as? PostIndexCell {
            categoryName = name
            tableView.reloadRowsAtIndexPaths([Const.categorySectionIndexPath], withRowAnimation: .None)
        }
    }
}

extension PostDataHandler: PostViewControllerDelegate {
    func updateKeyboardNavigation(string: String, color: UIColor) {
        delegate?.updateKeyboardNavigation(string, color: color)
    }

    func closeKeyboard() {
        delegate?.closeKeyboard()
    }

    func showIngredientCreator(name: String, amount: Int) {
        delegate?.showIngredientCreator(name, amount: amount)
    }

    func showCategorySelector(id: Int) {
        delegate?.showCategorySelector(id)
    }
}
