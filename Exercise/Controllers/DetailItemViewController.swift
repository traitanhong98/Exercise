//
//  DetailItemViewController.swift
//  Exercise
//
//  Created by ECO0813-THANGNV on 4/19/22.
//

import UIKit

class DetailItemViewController: UIViewController {
    
    @IBOutlet weak var item_avata: UIImageView!
    @IBOutlet weak var item_id: UILabel!
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var item_address: UILabel!
    @IBOutlet weak var item_createad: UILabel!
    @IBOutlet weak var item_dayworking: UILabel!
    @IBOutlet weak var item_male: UILabel!
    
    var employee = Employee(id: "", name: "", createAt: "", avatar: "", address: "", isMale: true, status: "", dayWorking: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(employee: employee)
        
    }

    func setupUI(employee: Employee){
//        print(employee.avatar)
        item_avata.image = UIImage(named: employee.avatar)
        item_id.text    = "ID: " + employee.id
        item_name.text  = "Name " + employee.name
        item_createad.text = "Date: " + employee.createAt
        item_address.text  = "Address: " + employee.address
        if employee.isMale {
            item_male.text = "Male: Nam"
        } else {
            item_male.text = "Male: Nữ"
        }
        let rankMember = EmployeeRanks.getEmployeeRanks(dayWorking: employee.dayWorking)
//        print(rankMember)
        item_dayworking.text = "Rank: \(rankMember)"
        
        
    }

    @IBAction func back_detail(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
