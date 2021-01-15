//
//  TotalViewController.swift
//  CalorieCounter
//
//  Created by Oluwakemi Onajinrin on 13/01/2021.
//

import UIKit


var mealArray : [String] = []
var CalArray : [Float] = []


//var mealCalDic : [String : String] = [:]

class TotalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
//    var floatcal : [Float] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // IB OUTLETS
    
    @IBAction func addMoreMeal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dailyGoal: UILabel!
    
    @IBAction func dailyGoalNum(_ sender: Any) {
    }
    @IBOutlet weak var cal: UILabel!
    @IBOutlet weak var totalCalories: UILabel!
    
    @IBOutlet weak var totalCaloriesNumber: UILabel!
    @IBOutlet weak var remainingCal: UILabel!
    
    @IBOutlet weak var remainingCalNum: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CalArray.count
//        return mealCalDic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"
       
        let ourCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TotalViewCell

        ourCell.mealLabel.text = mealArray[indexPath.row]
        ourCell.calorieLabel.text = String(CalArray[indexPath.row])
        
        return ourCell    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            mealArray.remove(at: indexPath.row)
            CalArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()

        }
    }
    
    func addData(meal: String, cal: Float){
        mealArray.append(meal)
        CalArray.append(cal)
        let sum = CalArray.reduce(0, +)
    
      totalCaloriesNumber?.text = "\(sum)"
        self.tableView?.reloadData()
        print(String(sum))
        print(totalCaloriesNumber?.text!)
//        print(mealArray)
//        self.tableView?.reloadData()
        
    }
    
}
