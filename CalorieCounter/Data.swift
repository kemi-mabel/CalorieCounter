//
//  Data.swift
//  CalorieCounter
//
//  Created by Oluwakemi Onajinrin on 05/01/2021.
//

import Foundation
class MealModel {
    
    var meal = ""
    var sizenumber = ""
    var caloriesnumber = ""
    var portionsize = ""
    var backgroundImage = ""
    
    init(meal: String, sizenumber: String, caloriesnumber: String, portionsize: String, backgroundImage: String) {
        self.meal = meal
        self.sizenumber = sizenumber
        self.caloriesnumber = caloriesnumber
        self.portionsize = portionsize
        self.backgroundImage = backgroundImage
    }
}
