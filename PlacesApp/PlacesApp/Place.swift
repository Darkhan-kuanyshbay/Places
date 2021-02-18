//
//  Place.swift
//  PlacesApp
//
//  Created by Darkhan Kuanyshbay on 18.02.2021.
//

import Foundation
import MapKit

struct Place: Identifiable{
    var name: String
    var location: CLLocationCoordinate2D
    var id = UUID()
}
