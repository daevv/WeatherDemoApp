


import SwiftUI
import CoreLocationUI


//Настраиваем приветсвующее нас окошко
struct WelcomeView: View {
    @EnvironmentObject var locationManager:
        LocationManager
    
    var body: some View {
        VStack {
            //текст в окошке
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                .bold().font(.title)

                Text("Please share your current location
                    to get the weather on your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding
            //Кнопочка
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeigth: .infinity)
    }  
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}