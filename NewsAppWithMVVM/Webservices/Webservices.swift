//
//  Webservices.swift
//  NewsAppWithMVVM
//
//  Created by Mohamed on 5/29/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import Foundation


class Webservices{
    
    let session = URLSession.shared
    
    init() {
        
        print("Webservices created")
    }
    
    func getArticles(url: URL , completion: @escaping ([Article]?)->()){
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error{
                
                completion(nil)
                fatalError("There's error while fetching data \(error.localizedDescription)")
            }
            
            if let data = data{
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList{
                    
                    completion(articleList.articles)
                    
                }
                
                print(articleList?.articles)
                
            }
            
        }
        .resume()
    }
}
