//
//  ViewController.swift
//  NewsAppWithMVVM
//
//  Created by Mohamed on 5/29/20.
//  Copyright © 2020 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-04-28&sortBy=publishedAt&apiKey=0778f3aadfec4cf0bd286cab7686746e")
    
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        reteriveData(url: url!)
        
    }
    
    
    func reteriveData(url: URL){
        
        
        Webservices().getArticles(url: url) { articles in
            
            if let articles = articles{
                
                self.articleListViewModel = ArticleListViewModel(articls: articles)
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfRowAtSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            
            fatalError("Something went wrong")
        }
        
        let article = articleListViewModel.getArticleAtIndexOf(indexPath.row)
        
        cell.labelTitle.text = article.title
        
        cell.labelDescription.text = article.description
        
        return cell
    }
}

