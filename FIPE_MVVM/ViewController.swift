//
//  ViewController.swift
//  FIPE_MVVM
//
//  Created by Aline Sena on 09/12/20.
//

import UIKit

class ViewController: UIViewController {
    var array = [Brand]()
    var apiManager = Api_manager()

    @IBOutlet weak var fipe_tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fipe_tableview.delegate = self
        fipe_tableview.dataSource = self
       
        loadData()
        
    }
    
    func loadData(){
        apiManager.loadData(){ Success in
            self.array = self.apiManager.arrayBrand
            self.fipe_tableview.reloadData()
            
        }
    }

}


extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = array[indexPath.row].name
        return cell
    }
    

}


