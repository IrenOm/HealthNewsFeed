//
//  WebViewController.swift
//  HealthNewsFeed
//
//  Created by irena.omelana on 18/05/2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var urlString: String = String()

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "web"
    guard let url = URL(string: urlString) else {return}
        
        webView.load(URLRequest(url: url))

        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start nav")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("stop nav")
    }
    
    

}
