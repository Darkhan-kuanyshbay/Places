//
//  MapView.swift
//  PlacesApp
//
//  Created by Darkhan Kuanyshbay on 18.02.2021.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate{
    var control: MapView
    
    init(_ control: MapView){
        self.control = control
    }
}

struct MapView: UIViewRepresentable{
    @Binding var mapType: String
    @Binding var currentPlace: Place
    var mapTypeDict: [String: MKMapType] = [
        "Normal": .standard,
        "Hybrid": .hybrid,
        "Satellite": .satellite
    ]
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.mapType = mapTypeDict[mapType] ?? .standard
        uiView.removeAnnotations(uiView.annotations)
        uiView.setRegion(.init(center: currentPlace.location, latitudinalMeters: 1000000, longitudinalMeters: 1000000), animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = currentPlace.location
        annotation.title = currentPlace.name
        uiView.addAnnotation(annotation)
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}
