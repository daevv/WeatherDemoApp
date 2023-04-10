


import SwiftUI


//Настраиваем кружочек загрузки
struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle
                (tint: .white))
            .frame(maxWidth: .infinity, maxHeigth: 
                .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}