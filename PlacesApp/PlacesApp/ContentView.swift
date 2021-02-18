//
//  ContentView.swift
//  PlacesApp
//
//  Created by Darkhan Kuanyshbay on 18.02.2021.
//
// UIViewRepresentable
// Coordinator
import SwiftUI

struct ContentView: View {
    @State var mapType: String
    @State var currentPlace: Place

    var body: some View {
        
        VStack{
            MapArea(mapType: $mapType, currentPlace: $currentPlace)
            PlacesView(currentPlace: $currentPlace)
        }.ignoresSafeArea(.all)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mapType: "Normal", currentPlace: .init(name: "Suleyman Demirel University", location: .init(latitude: 16.123123, longitude: 67.676767)))
            .previewDevice("iPhone 12")
    }
}

struct MapArea: View {
    @Binding var mapType: String
    @Binding var currentPlace: Place
    var mapTypes = [
        "Normal",
        "Satellite",
        "Hybrid"
    ]
    var body: some View {
        ZStack(alignment: .bottom){
            MapView(mapType: $mapType, currentPlace: $currentPlace)
            Picker(selection: $mapType, label: Text("Map Type"), content: {
                ForEach(mapTypes, id: \.self){
                    Text($0)
                }
            })
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 300, height: 75)
        }
    }
}

struct PlacesView: View {
    @Binding var currentPlace: Place
    var places: [Place] = [
        .init(name: "Kazakhstan", location: .init(latitude: 13.12323, longitude: 45.141243)),
        .init(name: "Russia", location: .init(latitude: 15.4857847, longitude: 10.12937198)),
        .init(name: "USA", location: .init(latitude: 33.4545, longitude: 97.123872))
    ]
    var body: some View {
        List{
            ForEach(places){ place in
                HStack{
                    Text(place.name)
                    Spacer()
                    Button("Go"){
                        currentPlace = place
                    }.foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.blue)
                    .cornerRadius(20)
                }
                
            }
        }.frame(height: UIScreen.main.bounds.height/3)
    }
}
