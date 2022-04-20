//
//  MainViewCell.swift
//  Exercise
//
//  Created by ECO0817-QUANGNH on 18/04/2022.
//

import UIKit

class MainViewCell: UITableViewCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAdress: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(employee: Employee) {
        lbName.text = employee.name
        lbAdress.text = employee.address
        if employee.isMale {
            lbGender.text = "nam"
        } else {
            lbGender.text = "nữ"
        }
        //cell.lbStatus.text  = data.dayWorking
        let level = EmployeeLevel.getEmployeeLevel(dayWorking: employee.dayWorking)
        lbStatus.text = level.title
    }
    
}
