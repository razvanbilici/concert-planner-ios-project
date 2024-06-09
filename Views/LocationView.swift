//
//  LocationView.swift
//  project2024
//
//  Created by user264991 on 6/9/24.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var selectedLocation: CLLocationCoordinate2D? = nil

    var body: some View {
        VStack {
            MapView(region: $region, selectedLocation: $selectedLocation)
                .edgesIgnoringSafeArea(.all)

            if let location = selectedLocation {
                Text("Selected Location: \(location.latitude), \(location.longitude)")
                    .padding()
            } else {
                Text("Select location")
                    .bold()
                    .padding()
            }
        }
    }
}

struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    @Binding var selectedLocation: CLLocationCoordinate2D?

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            parent.region = mapView.region
        }

        @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
            let location = gestureRecognizer.location(in: gestureRecognizer.view as! MKMapView)
            let coordinate = (gestureRecognizer.view as! MKMapView).convert(location, toCoordinateFrom: gestureRecognizer.view)
            parent.selectedLocation = coordinate
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        let gestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(gestureRecognizer:)))
        mapView.addGestureRecognizer(gestureRecognizer)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)

        if let selectedLocation = selectedLocation {
            let annotation = MKPointAnnotation()
            annotation.coordinate = selectedLocation
            uiView.addAnnotation(annotation)
        }
    }
}

#Preview {
    LocationView()
}
