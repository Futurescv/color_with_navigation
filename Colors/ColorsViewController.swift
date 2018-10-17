//
//  ColorsViewController.swift
//  Colors
//
//  Created by 123 on 2018/9/28.
//  Copyright © 2018年 Jin. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var colors = [Color(name:"red", uiColor: UIColor.red),
                  Color(name:"orange", uiColor:UIColor.orange),
                  Color(name:"yellow", uiColor:UIColor.yellow),
                  Color(name:"green", uiColor:UIColor.green),
                  Color(name:"blue", uiColor:UIColor.blue),
                  Color(name:"purple",uiColor:UIColor.purple),
                  Color(name:"brown", uiColor:UIColor.brown)]
    
    
    @IBOutlet weak var colorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Colors"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        cell.textLabel?.text = colors[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row].uiColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
            let row = colorTableView.indexPathForSelectedRow?.row
        {
            destination.color = colors[row]
        }
    }

}
