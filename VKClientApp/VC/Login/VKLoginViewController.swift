//
//  VKLoginViewController.swift
//  VKClientAppCS
//
//  Created by Sergey Simashov on 11.02.2022.
//

import UIKit
import WebKit

final class VKLoginViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    private var urlComponents: URLComponents = {
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "oauth.vk.com"
        comp.path = "/authorize"
        comp.queryItems = [
            URLQueryItem(name: "client_id", value: "8077521"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        return comp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let url = urlComponents.url
        else { return }
        
        webView.load(URLRequest(url: url))
    }
}


extension VKLoginViewController: WKNavigationDelegate {
    
}
