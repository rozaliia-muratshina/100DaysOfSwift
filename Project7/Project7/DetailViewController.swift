//
//  DetailViewController.swift
//  Project7
//
//  Created by Розалия on 06.08.2020.
//  Copyright © 2020 Розалия. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }

        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 125%;"font-family:courier;} </style>
        </head>
        <body style="background-color:ghostwhite;font-family:courier;">
        \(detailItem.body)
        </body>
        </html>
        """
   

        webView.loadHTMLString(html, baseURL: nil)    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
