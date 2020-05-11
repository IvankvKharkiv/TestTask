//
//  SearchResTblViewCtrl_Navigation.swift
//  TestTask_Fin
//
//  Created by iv on 5/10/20.
//  Copyright © 2020 iv. All rights reserved.
//

import UIKit
import SafariServices

class SearchResTblViewCtrl: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var SearchResOffset:Int = 0
    var catName:String = ""
    
    var listOfDocs = [CatDocument](){
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    
    @IBAction func btn_Previouse10Res(_ sender: Any) {
        if (SearchResOffset - 1) < 0 {
            return
        }
        SearchResOffset -= 1
        setTableData(CategoryName: catName, pageOffsetNum: SearchResOffset)
    }
    
    
    @IBAction func btn_Next10Res(_ sender: Any) {
        if ( (SearchResOffset*10) >= numberOfResults ){
            return
        }
        SearchResOffset += 1
        setTableData(CategoryName: catName, pageOffsetNum: SearchResOffset)

    }
    
    
    public func setTableData(CategoryName: String, pageOffsetNum: Int){
        catName=CategoryName
        SearchResOffset = pageOffsetNum
        let dataRequest = DataRequest(categoryName: CategoryName, pageOffsetNum: pageOffsetNum)
        dataRequest.getData { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let Docs):
               self?.listOfDocs = Docs
            }
        }
    }
    
    
    

}

extension SearchResTblViewCtrl: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfDocs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom_Cell", for: indexPath) as! Custom_TableViewCell
        let CurrentDoc = listOfDocs[indexPath.row].self
        
        cell.lbl_web_url.text = CurrentDoc.web_url
        cell.lbl_snippet.text = CurrentDoc.snippet
        cell.lbl_headline_main.text = CurrentDoc.headline.main
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let CurrentDoc = listOfDocs[indexPath.row].self
        let vc = SFSafariViewController(url: URL(string: CurrentDoc.web_url )!)
        present(vc, animated: true)
        
    }

}
