

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody

    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack {
                //Название города
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    //Дата и время
                    Text("Today,
                        \(Date().formatted(.dateTime
                        .month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: 
                    .leading)

                Spacer()

                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            //Иконка погоды
                            Image(systemName: String)
                                .font(.system(size: 40))
                            //подпись к иконке
                        Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment:
                            .leading)

                        Spacer()

                        //Температура
                        Text(weather.main.feelsLike
                            .roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    

                    //Картинкааааа
                    AsyncImage(url: URL(string:
                        "ссылка на картинку")) { image in
                        image
                            .resizable()
                            .aspectRatio(ContentMode: 
                                .fit)
                            .frame(width: 350)
                        } placeholder: {
                            ProgressView()
                        }

                        Spacer()
                }
                .frame(maxWidth: .infinity)

            }
            .padding()
            .frame(maxWidth: .infinity, alignment:
                .leading)
            
            VStack {
                Spacer()

                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "картинка", name: "Min temp", value:
                            (weather.main.tempMin
                            .roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "картинка", name: "Max temp", value:
                            (weather.main.tempMax
                            .roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "картинка", name: "Wind Speed", value:
                            (weather.wind.speed
                            .roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "картинка", name: "Humidity", value:
                            (weather.main.humidity
                            .roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment:
                    .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656,
                    saturation: 0.787, brightness:0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft,
                    .topRigth])
            }

        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656,
            saturation: 0.787, brightness:
            0.354))
        .preferredColorScheme(.dark)
    }
}

static WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}