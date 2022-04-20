//
//  MainViewController.swift
//  Exercise
//
//  Created by Nguyễn Hoàng on 17/04/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainView: UITableView!
    var arrData = employees
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        mainView.delegate = self
        mainView.dataSource = self
        mainView.register(UINib(nibName: "MainViewCell", bundle: nil), forCellReuseIdentifier: "MainViewCell")
    }
    
    @IBAction func clickedChangeInformationEmployeeVC(_ sender: Any) {
        let vc = InformationViewController()
        vc.arrInfor = arrData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell dùng để tái sử dụng cell liên tục
        let cell = mainView.dequeueReusableCell(withIdentifier: "MainViewCell") as! MainViewCell
        let data = arrData[indexPath.row]
        cell.bindData(employee: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = arrData[indexPath.row]
        let item = DetailViewController()
        item.employee = select
        self.navigationController?.pushViewController(item, animated: true)
    }
    
}


