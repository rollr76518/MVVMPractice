//
//  ViewController.swift
//  MVVMPractice
//
//  Created by Hanyu on 2019/7/3.
//  Copyright © 2019 Hanyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView(frame: .zero)
    
    var viewModel = ViewModel()
    
    var datePicker = UIDatePicker()
    
    var picker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        var inputView: UIView?
        let inputViewType = self.viewModel.inputViewType(indexPath: indexPath)
        switch inputViewType {
        case .datePicker:
            inputView = self.datePicker
        case .picker:
            inputView = self.picker
        default:
            inputView = nil
        }
        cell.textField.inputView = inputView
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
