//
//  EmployeeTableViewCell.swift
//  Exercise
//
//  Created by ECO0813-THANGNV on 4/18/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showAddress: UILabel!
    @IBOutlet weak var showSex: UILabel!
    @IBOutlet weak var showPosition: UILabel!
    
    @IBAction func btn_edit(_ sender: Any) {
        
        print("edit")
        
    }
    @IBAction func btn_delete(_ sender: Any) {
        print("delete")
    }
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
     
    }
    
    func binData(employee: Employee) {
        showName.text      = employee.name
        showAddress.text   = employee.address
        if employee.isMale {
            showSex.text = "Nam"
        } else {
            showSex.text = "Nữ"
        }
        let rankMember = EmployeeRanks.getEmployeeRanks(dayWorking: employee.dayWorking)
        
        showPosition.text = rankMember.title
    }
    
    
}
