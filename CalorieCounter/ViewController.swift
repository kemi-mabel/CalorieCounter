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
    @IBAction func stepperAction(_ sender: UIStepper) {
        numberLabel.text = String(sender.value)
//        let sizenumber = sizeNumber.text
        
//        var sizenumbers = sizeNumber.text
        
        let doublenumberlabel = Double(numberLabel.text!)
        let doublesizenumber = Double(sizeNumber.text!)
        
        let mulsizenumber = (doublenumberlabel ?? 1) * (doublesizenumber ?? 1)
        sizeNumber.text = String(mulsizenumber)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfObjects()
        // Do any additional setup after loading the view.
    }
    func listOfObjects(){
//here I'm using the map function to get the meal names instead of using an another array.
        dropDown.optionArray = mealModelArr.map({
            return $0.meal
        })
        
//    Its Id Values and its optional
        dropDown.optionIds = [0,1,2]
        
//     The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            
            ///this is where I'm calling the method that modifies the UI
            self.modifyOnDropDownSelect(id: id)
            
            
//            print("Selected String: \(selectedText) \n index: \(index)")
//            self.dropDown.text = "Selected String: \(selectedText) \n index: \(index)"
        
    }
    }
    
    var mealModelArr: [MealModel] = [
        MealModel(meal: "Beer" , sizenumber: "356g", caloriesnumber: "154", portionsize: "can", backgroundImage: "Beer"),
        MealModel(meal: "Champagne", sizenumber: "175ml", caloriesnumber: "133", portionsize: "Medium Glass", backgroundImage: "veggies"),
        MealModel(meal: "Red Wine" , sizenumber: "175ml", caloriesnumber: "149", portionsize: "Small Glass", backgroundImage: "Beer")
    ]

    func modifyOnDropDownSelect(id:Int){
        
        ///picking a single element
        let singleMealModel = mealModelArr[id]
        
        ///modifying the UI on the main thread
        DispatchQueue.main.async { [self] in
            sizeNumber.text = singleMealModel.sizenumber
            caloriesNumber.text = singleMealModel.caloriesnumber
            portionSize.text = singleMealModel.portionsize
            backgroundImage.image = UIImage(named: singleMealModel.backgroundImage)
        }
    }
}

