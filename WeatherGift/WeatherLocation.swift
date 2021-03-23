//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Grace Carroll on 3/18/21.
//

import Foundation

struct WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        
    }
    
    func getData() {
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&units=imperial&appid=\(APIkeys.openWeatherKey)"
        
        print("Accessing the url \(urlString)")
        
        // create a url
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a url from \(urlString)")
            return
        }
        // create session
        let session = URLSession.shared
        
        // get data with .datatask
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR \(error.localizedDescription)")
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("\(json)")
            } catch {
                print("ERROR JSON")
            }
        }
        task.resume()
    }
    
}
