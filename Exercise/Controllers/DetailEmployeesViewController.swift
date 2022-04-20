//
//  DetailEmployeesViewController.swift
//  Exercise
//
//  Created by ECO0813-THANGNV on 4/19/22.
//

import UIKit

class DetailEmployeesViewController: UIViewController {
    
    @IBOutlet weak var totalEmployees: UILabel!
    @IBOutlet weak var fillEmployee: UILabel!
    @IBOutlet weak var filterEmployee_lastDay: UILabel!
    @IBOutlet weak var totalSalary: UILabel!
    var employee: [Employee]!
    var arrSalaryEmployee: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // lọc ra những nhân viên làm từ 200 ngày trở lên
        let filterArrDayWorking = employee.filter({$0.dayWorking >= 200})
        // xem 2 tháng sau nhân viên có số ngày làm việc là bao nhiêu
        let mapArrLastDayWorking = employee.map({$0.dayWorking + 60})
        // sau 2 tháng lọc ra những thanh viên làm việc từ 200 ngày trở lên
        let filterArrLastDayWorking = mapArrLastDayWorking.filter({$0 >= 200})
        
        for salary in mapArrLastDayWorking {
            switch salary {
            case 0..<200:
                arrSalaryEmployee.append(1000)
            case 200..<400:
                arrSalaryEmployee.append(1500)
            default:
                arrSalaryEmployee.append(2000)
            }
        }

        let totalSalaryEmployee = arrSalaryEmployee.reduce(0, {$0 + $1})
        
        totalEmployees.text = "Có tất cả \(employee.count) nhân viên"
        fillEmployee.text   = "Có \(filterArrDayWorking.count) nhân viên đã làm việc trên 200 ngày"
        filterEmployee_lastDay.text = "Sau 2 tháng có tất cả \(filterArrLastDayWorking.count) nhân viên làm việc trên 200 ngày"
        totalSalary.text = "Tổng chi phí công ti phải sau 2 tháng là \(totalSalaryEmployee)$"
    }
    
    @IBAction func back_detailemployee(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
