//
//  WelcomePageView.swift
//  mattersoftheheart
//
//  Created by Dominique Escoe on 1/28/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showTransitionView = false // Tracks navigation state
    @State private var animate = false // State variable to track animation
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black // Black background
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
                    
                    Text("Welcome to Matters of the Heart")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.white)
                    
                    Text("""
Discover the power of emotional intelligence as you navigate real-life scenarios involving love, trust, and friendship. Your choices shape the journey—will you follow your heart, your head, or find the perfect balance? Let the Heart Meter guide you as you uncover lessons in empathy, growth, and connection. Welcome to the game where every decision matters!
""")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.white)
                    
                    Spacer() // Pushes button to the bottom
                    
                    HStack {
                        Spacer() // Pushes button to the right
                        
                        Button(action: {
                            showTransitionView = true // Navigate to the TransitionView
                        }) {
                            Text("Next")
                                .font(.title2)
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(Color(hex: "#F045A1")) // Custom pink color
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.trailing, 20) // Adds right padding
                        .padding(.bottom, 20) // Adds bottom padding
                    }
                }
                .padding()
            }
            .navigationDestination(isPresented: $showTransitionView) {
                TransitionView()
            }
        }
    }
}



#Preview {
    WelcomeView()
}
