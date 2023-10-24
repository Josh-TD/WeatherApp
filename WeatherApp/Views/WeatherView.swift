import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name).bold().font(.title)
                    Text("Today: \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                }.frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud.sun").font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }.frame(width: 150, alignment: .leading)
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°").font(.system(size: 80)).padding()
                    }
                    Spacer().frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://wallpapers.com/images/high/vaporwave-background-ubqc5w5sgtmisqok.webp")) { image in image .resizable().aspectRatio(contentMode: .fit).frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
            }.padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now: ").bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "person.circle", name: "Min Temp", value: weather.main.tempMin.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "person.circle", name: "Max Temp", value: weather.main.tempMax.roundDouble() + "°")

                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed
                            .roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity.fill", name: "Humiditiy", value: weather.main.humidity.roundDouble() + "°")

                    }
                }.frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom, 20).foregroundColor(Color(red: 0.592, green: 0.001, blue: 0.999)).background(.white).cornerRadius(20, corners: [.topLeft, .topRight])
            }
            
        }.edgesIgnoringSafeArea(.bottom).background(Color(red: 0.592, green: 0.001, blue: 0.999)).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
