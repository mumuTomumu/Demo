//
//  ViewController.swift
//  Demo
//
//  Created by zzz on 2019/12/01.
//  Copyright © 2019 tester. All rights reserved.
//

import UIKit
import Mapbox
class MBViewController: UIViewController {
    lazy var mapView: MGLMapView = {
        var myMapView: MGLMapView = MGLMapView(frame: UIScreen.main.bounds)
        myMapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myMapView.setCenter(CLLocationCoordinate2D(latitude: 40.74699, longitude: -73.98742), zoomLevel: 15, animated: false)
        myMapView.showsScale = true
        myMapView.scaleBarPosition = .topLeft
        myMapView.scaleBarMargins = CGPoint(x: 8, y: 100)
        myMapView.scaleBar.backgroundColor = UIColor.red
        return myMapView
    }()
    var windowFrame:CGRect {
        return UIApplication.shared.keyWindow?.bounds ?? UIScreen.main.bounds
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
        button.addTarget(self, action: #selector(self.click), for: .touchUpInside)
        button.setTitle("zoomLevel", for: .normal)
        button.backgroundColor = UIColor.blue
        view.addSubview(button)
        
        
        let button2 = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        button2.addTarget(self, action: #selector(self.click1), for: .touchUpInside)
        button2.setTitle("zoom -= 0.0001", for: .normal)
        button2.backgroundColor = UIColor.red
        view.addSubview(button2)
        // Do any additional setup after loading the view.
    }
    @objc func click() {
        self.mapView.setZoomLevel(mapView.zoomLevel, animated: true)
    }
    
    @objc func click1() {
        self.mapView.setZoomLevel(mapView.zoomLevel - 0.0001, animated: true)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        coordinator.animate(alongsideTransition: { (_) in
            self.mapView.frame = self.windowFrame
            print("zoomlevel:\(self.mapView.zoomLevel),map.bounds:\(self.mapView.bounds)")
            self.mapView.setZoomLevel(self.mapView.zoomLevel, animated: false)
        }) { (_) in
            
        }
    }
}
