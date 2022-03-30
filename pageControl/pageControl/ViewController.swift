//
//  ViewController.swift
//  pageControl
//
//  Created by Isaac Shin on 2022/03/30.
//

import UIKit

class ViewController: UIViewController {

    var images = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg"]
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lblCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        pageControl.numberOfPages = images.count
//        pageControl.currentPage = 0
//        pageControl.pageIndicatorTintColor = UIColor.green
//        pageControl.currentPageIndicatorTintColor = UIColor.brown
//
//        imgView.image = UIImage(named: images[0])
        
        
            //mission
        pageControl.numberOfPages = 100
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.brown
        
        lblCount.text = "0"
    }

    // Action 함수에 대한 Event 설정은 액션 함수를 언제 실행할지를 결정하는 중요한 항목이다.
    @IBAction func pageChange(_ sender: UIPageControl) {
//        imgView.image = UIImage(named: images[pageControl.currentPage])
        
        //mission
        lblCount.text = String(self.pageControl.currentPage)
    }
    
}

