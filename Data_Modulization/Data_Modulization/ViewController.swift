//
//  ViewController.swift
//  Data_Modulization
//
//  Created by Tarun Meena on 11/03/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController { 

    @IBOutlet weak var tableview: UITableView!
  
    var charName = [String]()
    var urlName = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        get_Data()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func get_Data() {
        let url = "https://api.myjson.com/bins/cqdzi"
        request(url).responseJSON { (myResponse) in
            switch myResponse.result {
            case .success:
                print(myResponse.result)
                let myresult = try? JSON(data: myResponse.data!)
                print(myresult!["results"])
                let resultArray = myresult!["results"]
                self.charName.removeAll()
                for i in resultArray.arrayValue{
                    let nameID = i["name"].stringValue
                    self.charName.append(nameID)
                    let urlID = i["status"].stringValue
                    self.urlName.append(urlID)
                }
                self.tableview.reloadData()
                break
                
            case .failure:
                print(Error.self)
               break
            }
        }
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = charName[indexPath.row]
        cell?.detailTextLabel?.text = urlName[indexPath.row]
        print(cell?.detailTextLabel?.text)
        return cell!
    }
    
}
