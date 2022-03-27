//
//  ViewController.swift
//  WebviewPrac
//
//  Created by Isaac Shin on 2022/03/27.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url) // url 값을 받아 URL 형으로 선언
        let myRequest = URLRequest(url: myUrl!) // myUrl 을 받아 URLRequest 형으로 선언합니다.
        myWebView.load(myRequest) // UIWebView형의 myWebView 클래스의 load 메서드를 호출합니다.
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("http://2sam.net")
        
    }
    
    // 로딩 중인지를 확인하기 위한 함수
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    //로딩이 완료됬을 때 인디케이터를 다시 숨긴다 .
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // 로딩이 실패했을 경우에도 마찬가지로 인디케이터를 숨긴다. 
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    
    // http:// prefix check function
    func checkUrl(_ url: String) -> String{
        
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        
        if !flag{
            strUrl = "http://" + strUrl
        }
        
        return strUrl
    }
    

    // Top Menu Acttion
    
    @IBAction func btnGoToUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoToSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    @IBAction func btnGoToSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지</p><p><a href=\"http://2sam.net\">2sam으로 이동</p>"

        // webkit 에 있는 함수 -> open func loadHTMLString(_ string: String, baseURL: URL?) -> WKNavigation?
        myWebView.loadHTMLString(htmlString, baseURL: nil)


    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    
    //button Menu Action

    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}

