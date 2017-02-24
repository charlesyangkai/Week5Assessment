//
//  ViewController.swift
//  Week5Assessment
//
//  Created by Charles Lee on 24/2/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    
    
    let locationManager = CLLocationManager()
    var resultSearchController: UISearchController? = nil
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        // Search Bar & Table View Controller
        let tableViewController = storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        resultSearchController = UISearchController(searchResultsController: tableViewController)
        resultSearchController?.searchResultsUpdater = tableViewController
        
        let searchBar = resultSearchController?.searchBar
        searchBar?.sizeToFit()
        searchBar?.placeholder = "Search for bike stations"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
    }




}



extension ViewController: CLLocationManagerDelegate{

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Sian la got this stoopid twat error: \(error)")
    }
    
    // Info will be updated so we can get the latest info
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        // Span to current location
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
        
    }
    
    
    
    
    
    
    
    
}
