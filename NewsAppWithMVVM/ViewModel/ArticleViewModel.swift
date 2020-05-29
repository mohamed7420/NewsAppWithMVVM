//
//  ArticleViewModel.swift
//  NewsAppWithMVVM
//
//  Created by Mohamed on 5/29/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import Foundation


// display only one article data

struct ArticleViewModel{
    
    private let article: Article!
    
    init(_ article: Article) {
        
        self.article = article
    }
    
}

//MARK: extension of ArticleViewModel
extension ArticleViewModel{
    
    var title: String{
        
        return self.article.title
    }
    
    var description: String{
        
        return self.article.description
    }
}


//display all articls

struct ArticleListViewModel{
    
    let articls: [Article]
    
}


extension ArticleListViewModel{
    
    var numberOfSection: Int{
        
        get{
            
            return 1
        }
    }
    
    func numberOfRowAtSection(_ section: Int) -> Int{
        
        return self.articls.count
    }
    
    func getArticleAtIndexOf(_ index: Int) -> ArticleViewModel{
        
        let article = self.articls[index]
        
        return ArticleViewModel(article)
    }
    
}
