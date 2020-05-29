//
//  Article.swift
//  NewsAppWithMVVM
//
//  Created by Mohamed on 5/29/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import Foundation


struct ArticleList: Decodable{
    
    let articles: [Article]
}

struct Article: Decodable{
    
    let title: String
    let description: String
    
}
