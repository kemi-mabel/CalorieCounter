//
//  ViewController.swift
//  CalorieCounter
//
//  Created by Oluwakemi Onajinrin on 03/12/2020.
//

import UIKit
import iOSDropDown

class ViewController: UIViewController {
    
    //IBOUTLETS
    @IBOutlet weak var backgroundImage: UIImageView!
   
    @IBOutlet weak var dropDown: DropDown!
   
    @IBOutlet weak var portionLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var portionSize: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var sizeNumber: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var caloriesNumber: UILabel!
    @IBOutlet weak var addmealbtnoutlet: UIButton!
    @IBAction func addmealbutton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfObjects()
        
        // Do any additional setup after loading the view.
    }
    func listOfObjects(){
//     The list of array to display. Can be changed dynamically
//    dropDown.optionArray = ["Option 1", "Option 2", "Option 3"]
        dropDown.optionArray = mealArr
//    Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22]
//     The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            self.dropDown.text = "Selected String: \(selectedText) \n index: \(index)"
        
    }
    }
    
    var mealModelArr: [MealModel] = [
        MealModel(meal: "Beer" , sizenumber: "356g", caloriesnumber: "154", portionsize: "can", backgroundImage: "beer"),
        MealModel(meal: "Champagne", sizenumber: "175ml", caloriesnumber: "133", portionsize: "Medium Glass", backgroundImage: "champagne"),
        MealModel(meal: "Red Wine" , sizenumber: "175ml", caloriesnumber: "149", portionsize: "Small Glass", backgroundImage: "redwine")
    ]
    var mealArr = ["Beer", "Champage", "Red Wine" ]
}

