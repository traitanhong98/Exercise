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
//        let selectArrEmployee = dataEmployees[0]
        
        let show_DetailEmployee = DetailEmployeesViewController()
        show_DetailEmployee.employee = dataEmployees
        
        navigationController?.pushViewController(show_DetailEmployee, animated: true)
        
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
        cell.binData(employee: data)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDetail = dataEmployees[indexPath.row]
        let detail_item = DetailItemViewController()
        
        detail_item.employee = selectedDetail
        
        navigationController?.pushViewController(detail_item, animated: true)
        
    }
}
