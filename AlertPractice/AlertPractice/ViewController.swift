//
//  ViewController.swift
//  AlertPractice
//
//  Created by Isaac Shin on 2022/03/27.
//

import UIKit

class ViewController: UIViewController {

    //images
    
    let colorImg = UIImage(named: "2cl.jpg")
    let removedImg = UIImage(named: "remvoed.jpg")
    let bwImg    = UIImage(named: "2bw.jpg")
    
    var imgscolorStatus = true
    
    @IBOutlet var imgView: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = colorImg
        
    }

    @IBAction func BtnImgColor(_ sender: UIButton) {
        
        if(imgscolorStatus){ //if it's already in color alert the user
            
            let alreadyInColorAlert = UIAlertController(title: "Warning!!", message: "The Image is already in Color", preferredStyle: UIAlertController.Style.alert)
            
            //handler option : 특별한 동작이 없을경우 nil
            let onAction = UIAlertAction(title: "Ok!", style: UIAlertAction.Style.default, handler: nil)
            
            
            alreadyInColorAlert.addAction(onAction) // 생성된 onAction을 얼럿에 추가
            present(alreadyInColorAlert, animated: true, completion: nil) //메서드 실행 (?)
            
        }else{
            //change the img into color
            imgView.image = colorImg
            imgscolorStatus = true
        }
        
    }

    @IBAction func BtnImgBW(_ sender: UIButton) {
        if(imgscolorStatus){ //if it's on color
            let imgBwAlert = UIAlertController(title: "Warning!!", message: "This will change the pictur into Black and white! Proceed?", preferredStyle: UIAlertController.Style.alert)
            
            let bwAction = UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: {
                ACTION in self.imgView.image = self.bwImg
                self.imgscolorStatus = false
            })
            
            let cancelAction = UIAlertAction(title: "NO!", style: UIAlertAction.Style.default, handler: nil)
        
            imgBwAlert.addAction(bwAction)
            imgBwAlert.addAction(cancelAction)
            
            present(imgBwAlert, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func BtnImgSepia(_ sender: UIButton) {
        let imgRemoveAlert = UIAlertController(title: "Warning !", message: "Are you sure you want to remover the selected Image?", preferredStyle: UIAlertController.Style.alert)
        
        let removeAction = UIAlertAction(title: "Yes Remove it ", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imgView.image = self.removedImg
            self.imgscolorStatus = false
        })
        
        let bwAction = UIAlertAction(title: "No make it B&W", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imgView.image = self.bwImg
            self.imgscolorStatus = false
        })
        
        let clorAction = UIAlertAction(title: "No make it color", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imgView.image = self.colorImg
            self.imgscolorStatus = true
        })
        
        imgRemoveAlert.addAction(removeAction)
        imgRemoveAlert.addAction(bwAction)
        imgRemoveAlert.addAction(clorAction)
        
        present(imgRemoveAlert, animated: true, completion: nil)
        
    }
    
}

