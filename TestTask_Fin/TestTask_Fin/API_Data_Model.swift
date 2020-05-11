//
//  API_Data_Model.swift
//  TestTask_Fin
//
//  Created by iv on 5/10/20.
//  Copyright © 2020 iv. All rights reserved.
//

import Foundation

var numberOfResults:Int = 0

struct  Response_All:Decodable {
    var response:Response
}

struct  Response:Decodable {
    var docs:[CatDocument]
    var meta:meta_type
}

struct meta_type:Decodable {
    var hits:Int
    var offset:Int
}


struct CatDocument:Decodable{
    var web_url:String
    var snippet:String
    var headline:headline_info
}


struct headline_info:Decodable{
    var main:String
}

