//
//  APIManager+RecipeTimeline.swift
//  aroma
//
//  Created by Yoshikazu Oda on 2016/01/31.
//  Copyright © 2016年 Yoshikazu Oda. All rights reserved.
//

import Foundation
import Bolts

extension APIManager {
    func fetchRecipeTimelineNormal() -> BFTask {
        return request(.GET, path: "v1/recipe_timeline/normal").APIErrorHandler()
    }
}