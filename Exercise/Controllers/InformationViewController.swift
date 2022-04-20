//
//  InformationViewController.swift
//  Exercise
//
//  Created by ECO0817-QUANGNH on 20/04/2022.
//

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet weak var lbTotalEmploy: UILabel!
    @IBOutlet weak var lbTotalDay: UILabel!
    @IBOutlet weak var lbEmployWork: UILabel!
    @IBOutlet weak var lbTotalCost: UILabel!
    var arrInfor: [Employee]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalEmployee()
        countDayEmployee()
        countEmployeeSalaryIncrease()
        paywageEmployee()
    }
    
    func totalEmployee() {
        lbTotalEmploy.text = "Tổng số nhân viên:  \(arrInfor.count)"
    }
    
    func countDayEmployee() {
        lbTotalDay.text = "Tổng số nhân viên làm trên 200 ngày:  \(arrInfor.filter({$0.dayWorking>200}).count)"
    }
    
    func countEmployeeSalaryIncrease() {
        lbEmployWork.text = "Tổng số nhân viên sau 2 tháng có trên 200 ngày làm việc:  \(arrInfor.filter({$0.dayWorking+60>200}).count)"
    }
    
    func paywageEmployee() {
        var total = 0
        for i in arrInfor {
            if((i.dayWorking + 60) < 200) {
                total += 1000
            }else if(200 <= (i.dayWorking + 60) && (i.dayWorking + 60) < 400) {
                total += 1500
            }else {
                total += 2000
            }
        }
        lbTotalCost.text = "Tiền lương Công ty phải trả 2 tháng sau là:  \(total)$"
    }
    
    @IBAction func clickedBackMainVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
