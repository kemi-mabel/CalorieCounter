//
//  TotalViewCell.swift
//  CalorieCounter
//
//  Created by Oluwakemi Onajinrin on 14/01/2021.
//

import UIKit

class TotalViewCell: UITableViewCell {

//   IBOUTLETS
    
    @IBOutlet weak var mealLabel: UILabel!
    
    @IBOutlet weak var calorieLabel: UILabel!
    
    @IBOutlet weak var DeleteButton: UIButton!
    
    @IBAction func deleteButtonAct(_ sender: UIButton) {
        
    }
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
