import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack (spacing: 20) {
                Text("Welcome to Josh Daniel's Weather App").fontWeight(.semibold).font(.title3).multilineTextAlignment(.center)
                Text("Please share your location so that your location's weather data can be displayed!")
                    .multilineTextAlignment(.center).padding()
            }.padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }.cornerRadius(20).symbolVariant(.fill).foregroundColor(.black)
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
