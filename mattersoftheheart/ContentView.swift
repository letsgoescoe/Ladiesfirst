//
//  ContentView.swift
//  mattersoftheheart
//
//  Created by Dominique Escoe on 1/28/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

struct ContentView: View {
    @State private var showWelcomePage = false // Tracks navigation state
    @State private var animate = false // State variable to track animation

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Image("1") // Opening page image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .scaleEffect(animate ? 1.2 : 1.0) // Animates the scale
                        .opacity(animate ? 0.7 : 1.0) // Animates the opacity
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animate)
                        .onAppear {
                            animate.toggle() // Starts the animation when the view appears
                        }

                    Text("Matters of the Heart")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()

                    Button(action: {
                        showWelcomePage = true // Navigate to the Welcome Page
                    }) {
                        Text("Start Game")
                            .font(.title2)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color(hex: "#F045A1")) // Custom pink color
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .navigationDestination(isPresented: $showWelcomePage) {
                        WelcomeView()
                    }
                }
                .padding()
            }
        }
    }
}



#Preview {
    ContentView()
}
