//
//  API_Data_Request.swift
//  TestTask_Fin
//
//  Created by iv on 5/10/20.
//  Copyright © 2020 iv. All rights reserved.
//

import Foundation
import UIKit


enum ResponseError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct DataRequest {
    let resourceURL:URL
    
    init(categoryName:String, pageOffsetNum:Int) {

        let resourceString = "https://api.nytimes.com/svc/search/v2/articlesearch.json?begin_date=20190101&end_date=20200405&facet=false&facet_filter=false&fl=web_url%2Cheadline%2Csnippet&fq=news_desk%3A(\(categoryName))&page=\(String(pageOffsetNum))&sort=newest&api-key=nUdwHwl6DoAM13wg2sA70PbjFH76pKE6"
        guard let curURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = curURL
        
    }
    
    func getData (completion: @escaping(Result<[CatDocument], ResponseError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response_All.self, from: jsonData)
                let response_docs = response.response.docs
                numberOfResults = response.response.meta.hits
                completion(.success(response_docs))
                
            }catch{
                completion(.failure(.canNotProcessData))
            }
            
        }
        dataTask.resume()
    }
    
    
}

