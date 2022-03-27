//
//  ViewController.swift
//  PickerView
//
//  Created by Isaac Shin on 2022/03/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUME = 2
    let PICKER_VIEW_HEIGHT: CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg"]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var lblImageFileName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< 4 {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    //화면에 보여줄 컬럼의 열의 갯수 리턴
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUME
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    //각 컴포넌트의 데이터 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
////        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(component == 0){
            lblImageFileName.text = imageFileName[row]

        }else{
            imageView.image = imageArray[row]
        }
        
    }


}

