import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?

    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView().task {
                        do {
                            try await weather = weatherManager.getCurrentWeather(lat: location.latitude, lon: location.longitude)
                        } catch {
                            print("Error geting weather: \(error)")
                        }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else  {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }.background(Color(red: 0.592, green: 0.001, blue: 0.999)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
    
}

#Preview {
    ContentView()
}
