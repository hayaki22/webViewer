//
//  ViewController.swift
//  Swift6WKWeb1
//
//  Created by Hayaki Maruta on 2021/08/05.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet var Indicator: UIActivityIndicatorView!
    
    var webView = WKWebView()
    
    @IBOutlet var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Indicator.isHidden = true
        
        //大きさを決める
        
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
       
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        
        //URLをロードする
        let url = URL(string: "https://www.kurashiru.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        Indicator.layer.zPosition = 2
        
    }
    
        //ロードが完了した時に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Indicator.isHidden = true
        Indicator.stopAnimating()
    }
        //読み込みが開始された時に呼ばれるデリゲートメソッド
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Indicator.isHidden = false
        Indicator.startAnimating()
        
    }
    
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
}

