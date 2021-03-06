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
        static let descriptionIndexPath = NSIndexPath(forRow: 1, inSection: 1)
        static let categorySectionIndexPath = NSIndexPath(forRow: 2, inSection: 1)
        static let sections = [
            [
                [ "id": "titleHeader", "class": "UITableViewCell"],
            ],
            [
                [ "id": "title", "class": "PostFieldViewCell"],
                [ "id": "description", "class": "PostTextViewCell"],
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
        struct title {
            static let placeholder = localizedString("titlePlaceholder")
            static let maxLength: Int = 30
        }
        struct description {
            static let placeholder = localizedString("descriptionPlaceholder")
            static let maxLength: Int = 300
        }
        struct titleHeader {
            static let height: CGFloat = 35
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
    private var descriptionString = ""
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

    func setDescription(string: String) {
        if let _ = tableView.cellForRowAtIndexPath(Const.descriptionIndexPath) as? PostTextViewCell {
            descriptionString = string
            tableView.reloadRowsAtIndexPaths([Const.descriptionIndexPath], withRowAnimation: .None)
        }
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
        case "description":
            showInputTextView(descriptionString)
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
        case "titleHeader":
            height = Const.titleHeader.height
        case "title":
            height = PostTextFieldCell.height()
        case "description":
            let string = descriptionString == "" ? Const.description.placeholder : descriptionString
            height = PostTextViewCell.height(string)
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
        return ""
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
        case "titleHeader":
            return tableView.dequeueReusableCellWithIdentifier("titleHeaderCell")!
        case "title":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textFieldCell") as! PostTextFieldCell
            _cell.configure(Const.title.placeholder, max: Const.title.maxLength)
            _cell.delegate = self
            _cell.setSeparator(indexPath.row, lastIndex: Const.sections[indexPath.section].count)
            cell = _cell
        case "description":
            let _cell = tableView.dequeueReusableCellWithIdentifier("textViewCell") as! PostTextViewCell
            let string = descriptionString == "" ? Const.description.placeholder : descriptionString
            _cell.configure(string)
            _cell.delegate = self
            _cell.setSeparator(indexPath.row, lastIndex: Const.sections[indexPath.section].count)
            cell = _cell
        case "category":
            let _cell = tableView.dequeueReusableCellWithIdentifier("indexCell") as! PostIndexCell
            let text = categoryName != "" ? categoryName : localizedString("required")
            let color = categoryName != "" ? AppColorString : AppColorStringS
            _cell.configure(text, color: color)
            _cell.setSeparator(indexPath.row, lastIndex: Const.sections[indexPath.section].count)
            cell = _cell
        case "ingredientHeader":
            let _cell = tableView.dequeueReusableCellWithIdentifier("ingredientHeaderCell") as! PostIngredientHeaderCell
            _cell.configure(tableView.editing)
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

    func showInputTextView(string: String) {
        delegate?.showInputTextView(string)
    }

    func showCategorySelector(id: Int) {
        delegate?.showCategorySelector(id)
    }
}
