//
//  ViewController.swift
//  ExpandableTableViewCells_Demo
//
//  Created by LogicalWings Mac on 13/11/18.
//  Copyright © 2018 LogicalWings Mac. All rights reserved.
//

import UIKit

struct cellData {
    var openFlag = Bool()
    var title = String()
    var sectionData = [String]()
    
}

class TableViewController: UITableViewController {

    var tableData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableData = [cellData(openFlag: false, title: "Section 1", sectionData: ["Cell 1","Cell 2","Cell 3","Cell 4"]),
                     cellData(openFlag: false, title: "Section 2", sectionData: ["Cell 1","Cell 2","Cell 3"]),
                     cellData(openFlag: false, title: "Section 3", sectionData: ["Cell 1","Cell 2"])]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableData[section].openFlag == true{
            
           //return tableData[section].sectionData.count
            
           //but section has its title so 1 extra for secion title
            
            return tableData[section].sectionData.count + 1
            
        }else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell")else{
              
                return UITableViewCell()
            }
            
            cell.textLabel?.text = tableData[indexPath.section].title
            return cell
            
        }else{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell")else{
                
                return UITableViewCell()
            }
            
            cell.textLabel?.text = tableData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            
            if tableData[indexPath.section].openFlag == true{
                tableData[indexPath.section].openFlag = false
                
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
                
            }else{
                tableData[indexPath.section].openFlag = true
                
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
            }
        }else{
            
        }
    }
}

