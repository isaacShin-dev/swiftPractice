//
//  ViewController.swift
//  MapPrac
//
//  Created by Isaac Shin on 2022/03/28.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var lblLocation1: UILabel!
    @IBOutlet var lblLocation2: UILabel!
    @IBOutlet var myMap: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocation1.text = ""
        lblLocation2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도
        locationManager.requestWhenInUseAuthorization() //위치 데이터 추적 승인 요구
        locationManager.startUpdatingLocation() //위치 업데이트 시작
        myMap.showsUserLocation = true // 위치 보기 설정
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D{
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 위도, 경도값으로 위치 리턴
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) //
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation() // pin설치를 위함
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = country!
            if pm!.locality != nil{
                address += ""
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += ""
                address += pm!.thoroughfare!
            }
            
            self.lblLocation1.text = "현재위치"
            self.lblLocation2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            // current location
            self.lblLocation1.text = ""
            self.lblLocation2.text = ""
            
            locationManager.startUpdatingLocation() //현재위치 표시 
        }else if sender.selectedSegmentIndex == 1{
            //폴리택
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리택대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocation1.text = "보고 계신 위치"
            self.lblLocation2.text = "한국 폴리텍대학 강릉 캠퍼스"

        }else if sender.selectedSegmentIndex == 2{
            //publishing
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지 퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocation1.text = "보고 계신 위치"
            self.lblLocation2.text = "이지스퍼블리싱 출판사"
        }
    }
    
}

