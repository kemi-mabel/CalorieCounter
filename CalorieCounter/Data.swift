//
//  Data.swift
//  CalorieCounter
//
//  Created by Oluwakemi Onajinrin on 05/01/2021.
//

import Foundation
class MealModel {
    
    var meal = ""
    var sizenumber: Double = 0
    var caloriesnumber: Float = 0.0
    var portionsize = ""
    var backgroundImage = ""
    
    init(meal: String, sizenumber: Double, caloriesnumber: Float, portionsize: String, backgroundImage: String) {
        self.meal = meal
        self.sizenumber = sizenumber
        self.caloriesnumber = caloriesnumber
        self.portionsize = portionsize
        self.backgroundImage = backgroundImage
    }
}
