//
//  GainBrainView.swift
//  mattersoftheheart
//
//  Created by Dominique Escoe on 1/28/25.
//

import SwiftUI

struct GainBrainView: View {
    @State private var animate = false // State variable to track animation
    @State private var showChoosePathView = false // State variable for navigation

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black // Black background for the entire page
                    .edgesIgnoringSafeArea(.all) // Ensures the color covers the whole screen

                VStack {
                    Image("11") // Use your uploaded image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .scaleEffect(animate ? 1.2 : 1.0) // Animates the scale
                        .opacity(animate ? 0.7 : 1.0) // Animates the opacity
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animate) // Smooth animation
                        .onAppear {
                            animate.toggle() // Starts the animation when the view appears
                        }
                        .padding()
                    
                    Spacer() // Pushes the button to the bottom
                    Text("""
                    You're so Smart!
                    You gained a brain!!!
                    """)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()

                    Spacer()

                    HStack {
                        Spacer() // Pushes button to the right
                        
                        Button(action: {
                            showChoosePathView = true // Navigate to ChoosePathView
                        }) {
                            Text("Next")
                                .font(.title2)
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(Color(hex: "#F045A1")) // Custom pink color
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.trailing, 20) // Moves button away from the edge
                        .padding(.bottom, 20) // Moves button up from the bottom
                    }
                }
            }
            .navigationDestination(isPresented: $showChoosePathView) {
                ChoosePathView()
            }
        }
    }
}



#Preview {
    GainBrainView()
}
