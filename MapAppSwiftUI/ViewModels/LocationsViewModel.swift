//
//  LocationsViewModel.swift
//  MapAppSwiftUI
//
//  Created by Umut Ağbaba on 8.04.2023.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    let miniMapSpan = MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
    
    // show list of locations
    @Published var showLocationsList: Bool = false
    
    // show location detail via sheet
    @Published var sheetLocation: Location? = nil
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: mapLocation)
    }
    
    private func updateMapRegion(location : Location) {
        mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
    }
    
    func toggleLocationList() {
        withAnimation {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
            
        }
    }
    
    func nextButtonPressed() {
            // Get the current index
            guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
                print("Could not find current index in locations array! Should never happen.")
                return
            }
            
            // Check if the currentIndex is valid
            let nextIndex = currentIndex + 1
            guard locations.indices.contains(nextIndex) else {
                // Next index is NOT valid
                // Restart from 0
                guard let firstLocation = locations.first else { return }
                showNextLocation(location: firstLocation)
                return
            }
            
            // Next index IS valid
            let nextLocation = locations[nextIndex]
            showNextLocation(location: nextLocation)
        }
    
    func learnMoreButtonTapped() {
        
    }
    
}
