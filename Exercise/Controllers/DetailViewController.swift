//
//  DetailViewController.swift
//  Exercise
//
//  Created by ECO0817-QUANGNH on 19/04/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lbID: UILabel!
    @IBOutlet weak var lbCreated: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbAdress: UILabel!
    @IBOutlet weak var lbGender: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var lbRank: UILabel!
    
    var employee = Employee(id: "", name: "", createAt: "", avatar: "", address: "", isMale: true, status: "", dayWorking: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindDataUI(employee: employee)
    }
    
    func bindDataUI(employee: Employee) {
        lbID.text = employee.id
        lbCreated.text = employee.createAt
        imgAvatar.image = UIImage(named: employee.avatar)
        lbName.text = employee.name
        lbAdress.text = employee.address
        if employee.isMale {
            lbGender.text = "nam"
        } else {
            lbGender.text = "nữ"
        }
        lbStatus.text = employee.status
        let level = EmployeeLevel.getEmployeeLevel(dayWorking: employee.dayWorking)
        lbRank.text = level.title
    }
    
    @IBAction func clickedBackMainVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
