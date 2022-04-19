//
//  MainViewController.swift
//  Exercise
//
//  Created by Nguyễn Hoàng on 17/04/2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var showDetail: UIButton!
    @IBOutlet weak var showTabEmployees: UITableView!
    var dataEmployees = employees
 
    override func viewDidLoad() {
        super.viewDidLoad()
        showTabEmployees.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
        showTabEmployees.dataSource = self
        showTabEmployees.delegate = self
    }
    
    
    @IBAction func tapShowDetail(_ sender: Any) {
        
    }
}
// MARK: - UITableViewDataSource


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        
        let cell = showTabEmployees.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell") as! EmployeeTableViewCell
                let data = dataEmployees[indexPath.row]
        
                    cell.showName.text      = data.name
                    cell.showAddress.text   = data.address
                    if data.isMale == false {
                        cell.showSex.text = "nữ"
                    } else {
                        cell.showSex.text = "nam"
                    }
                let positionNumber = data.dayWorking

                    switch positionNumber {
                      case 0...200:
                        cell.showPosition.text = "Junior"
                      case 201...400:
                        cell.showPosition.text = "Middle"
                      case 401...600:
                        cell.showPosition.text = "Senior"

                      default:
                        cell.showPosition.text = "Master"
                    }
        
        
        
                return cell
       
    }
}
