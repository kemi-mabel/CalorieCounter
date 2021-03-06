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
    var doublecalnumber: Double = 0

    
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
        if dropDown.text == "" {
            // Alert
            let optionMenu = UIAlertController(title: nil, message: "Please Select Meal", preferredStyle: .alert)

            // Add actions to the menu
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:
                        nil)
            optionMenu.addAction(cancelAction)

                    // Display the menu
            shouldPerformSegue(withIdentifier: "goToTotal", sender: Any?.self)
            self.present(optionMenu, animated: true, completion: nil)
        }
        else {
            
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        numberLabel.text = String(sender.value)
        
        let doublenumberlabel = Double(sender.value)
//        doublesizenumber = Double(sizeNumber.text!)!
        
        let mulsizenumber = doublenumberlabel * doublesizenumber
        let mulcalnumber = doublenumberlabel * doublecalnumber
        sizeNumber.text = "\(mulsizenumber)"
        caloriesNumber.text = "\(mulcalnumber)"
        
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
            doublecalnumber = Double(singleMealModel.caloriesnumber)
            portionSize.text = singleMealModel.portionsize
            backgroundImage.image = UIImage(named: singleMealModel.backgroundImage)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTotal" && dropDown.text != "" {
            let destinationVC = segue.destination as! TotalViewController
            destinationVC.addData(meal: dropDown.text!, cal: Float(caloriesNumber.text!)!)
            destinationVC.tableView?.reloadData()

        }
        }
    

}

