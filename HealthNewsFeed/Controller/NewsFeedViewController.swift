//
//  ViewController.swift
//  HealthNewsFeed
//
//  Created by irena.omelana on 17/05/2023.
//

import UIKit
import SDWebImage

class NewsFeedViewController: UIViewController {
    
    private var newsItems: [Article] = []
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Health News"
        getNewsData()
        
    }
    
    @IBAction func infoBarItemTapped(_ sender: Any) {
//#warning("alert")
    }
    
    
    @IBAction func extraButtonTapped(_ sender: Any) {
//        #warning("???")
    }
    
    private func activityIndicator(animated: Bool) {
        DispatchQueue.main.async{
            
            if animated{
                self.activityIndicatorView.isHidden = false
                self.activityIndicatorView.startAnimating()
            }else{
                self.activityIndicatorView.isHidden = true
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    private func getNewsData() {
        activityIndicator(animated: true)
        
        NetworkManager.fetchData(url: NetworkManager.api) { newsItems in
            self.newsItems = newsItems.articles ?? []
            dump(self.newsItems)
            DispatchQueue.main.async{
                self.tblView.reloadData()
                self.activityIndicator(animated: false)
            }
        }
    }
    
    
} //class

extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as?
                NewsTableViewCell else { return UITableViewCell() }
        
        let item = newsItems[indexPath.row]
        cell.newsTitleLabel.text = item.title ?? ""
        cell.newsTitleLabel.numberOfLines = 0
        cell.newsImageView.sd_setImage(with: URL(string: item.urlToImage ?? ""),placeholderImage: UIImage(named: "image.jpg"))
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        let item = newsItems[indexPath.row]
        vc.titleString = item.title ?? "Title"
        vc.webString = item.url ?? ""
        vc.authorString = item.author ?? ""
        vc.descString = item.description ?? "Desc"
        vc.imageString = item.urlToImage ?? ""
//#warning("rets item passed")
        
//        present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
}
