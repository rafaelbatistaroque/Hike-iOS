import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false

    //MARK: - FUNCTIONS
    func randomImage(){
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while imageNumber == randomNumber

        imageNumber = randomNumber
    }

    var body: some View {
        VStack {
            //MARK: - HEADER
            VStack(alignment: .leading) {
                HStack {
                    Text("Hinking")
                        .font(.system(size: 46, weight: .black))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGrayLight,
                                    .customGrayMedium],
                            startPoint: .top,
                            endPoint: .bottom))

                    Spacer()

                    Button {
                        print("hiking")
                        isShowingSheet.toggle()
                    } label: {
                        CustomButtonView()
                    }
                }

                Text("Fun and enjoyable outdoor activity for friends and families.")
                    .multilineTextAlignment(.leading)
                    .italic()
                    .foregroundColor(.customGrayMedium)
            }
            .padding(.horizontal, 30)

            //MARK: - MAIN CONTENT
            ZStack {
                CustomCircleView()

                Image("image-\(imageNumber)")
                    .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
            }

            //MARK: - FOOTER
            Button {
                randomImage()
            } label:{
                Text("Explore More")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                .customGreenLight,
                                .customGreenMedium],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
            }
            .buttonStyle(GradientButton())

        }
        .frame(width: 320, height: 570)
        .background(CustomBackgroundView())
        .sheet(isPresented: $isShowingSheet) {
            SettingsView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
        }
    }
    
}

#Preview {
    CardView()
}
