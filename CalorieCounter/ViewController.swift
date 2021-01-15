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
    var doublesizenumber: Double = 0
//    var delegate : FoodCal?
    
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
//        let calorie = caloriesNumber.text
//     
//        delegate?.mealdata(meal: dropDown.text!, calories: caloriesNumber.text!)
//        self.performSegue(withIdentifier: "goToTotal", sender: self)
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        numberLabel.text = String(sender.value)
        
        let doublenumberlabel = Double(sender.value)
//        doublesizenumber = Double(sizeNumber.text!)!
        
        let mulsizenumber = doublenumberlabel * doublesizenumber
        sizeNumber.text = "\(mulsizenumber)"
        
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
        MealModel(meal: "Beer" , sizenumber: 356, caloriesnumber: 154, portionsize: "can", backgroundImage: "Beer"),
        MealModel(meal: "Champagne", sizenumber: 175, caloriesnumber: 133, portionsize: "Medium Glass", backgroundImage: "champagne"),
        MealModel(meal: "Red Wine" , sizenumber: 175, caloriesnumber: 149, portionsize: "Small Glass", backgroundImage: "redwine")
    ]

    func modifyOnDropDownSelect(id:Int){
        
        ///picking a single element
        let singleMealModel = mealModelArr[id]
        
        ///modifying the UI on the main thread
        DispatchQueue.main.async { [self] in
            sizeNumber.text = "\(singleMealModel.sizenumber)"
            doublesizenumber = singleMealModel.sizenumber
            caloriesNumber.text = "\(singleMealModel.caloriesnumber)"
            portionSize.text = singleMealModel.portionsize
            backgroundImage.image = UIImage(named: singleMealModel.backgroundImage)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTotal" {
            let destinationVC = segue.destination as! TotalViewController
            
            destinationVC.addData(meal: dropDown.text!, cal: Float(caloriesNumber.text!)!)
//            destinationVC.tableView?.reloadData()
            
        }
    }
//    func addMeal(){
//        let totalCaloriesNumber.text = 0
//        let sum = caloriesNumber + totalCaloriesNumber
//
//    }
}

