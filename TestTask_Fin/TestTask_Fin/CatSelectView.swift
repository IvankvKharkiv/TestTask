//
//  CatSelectView.swift
//  TestTask_Fin
//
//  Created by iv on 5/10/20.
//  Copyright © 2020 iv. All rights reserved.
//

import Foundation
import UIKit

class CatSelectView: UIViewController {
    
    @IBAction func btn_Sports(_ sender: Any) {
        LaunchTable(categoryName: "Sports")
    }
    @IBAction func btn_Arts(_ sender: Any) {
        LaunchTable(categoryName: "Arts")
    }
    @IBAction func btn_Business(_ sender: Any) {
        LaunchTable(categoryName: "Business")
    }
    @IBAction func btn_Books(_ sender: Any) {
        LaunchTable(categoryName: "Books")
    }
    @IBAction func btn_Movies(_ sender: Any) {
        LaunchTable(categoryName: "Movies")
    }
    
    
    private func LaunchTable(categoryName:String){
        let vc = storyboard?.instantiateViewController(identifier: "TableResults1") as! SearchResTblViewCtrl
        present(vc, animated: true)
        vc.setTableData(CategoryName: categoryName, pageOffsetNum: 0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
