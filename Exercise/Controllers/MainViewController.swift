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
        cell.lbName.text = data.name
        cell.lbAdress.text = data.address
        if data.isMale == false {
            cell.lbGender.text = "nữ"
        } else {
            cell.lbGender.text = "nam"
        }
        cell.lbStatus.text = data.status
        return cell
    }

}
