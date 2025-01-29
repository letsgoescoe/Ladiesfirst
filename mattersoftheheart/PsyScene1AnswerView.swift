//
//  PsyScene1AnswerView.swift
//  mattersoftheheart
//
//  Created by Dominique Escoe on 1/28/25.
//


import SwiftUI

struct PsyScene1AnswerView: View {
    @State private var selectedCategory: String? // Tracks the selected category for navigation
    @State private var animate = false // State variable to track animation
    
    let categories = [
        ("1", "You confront Emily angrily, yelling, “How could you do this to me? You’re the worst friend ever!” and storm off.."),
        ("2", "You don’t say anything but distance yourself from Emily. Later, you vent to other friends about how she betrayed you."),
        ("3", "You calmly ask Emily, “I saw evidence that you hacked my account. Can you explain what happened?”"),
        ("4", "You tell Emily, “I’m hurt and confused because I found evidence you hacked my account. I value our friendship and want to understand why this happened so we can fix things.”")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("8")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer() // Push content down
                    
                    // Heart icon (centered)
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .scaleEffect(animate ? 1.2 : 1.0)
                        .opacity(animate ? 0.7 : 1.0)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animate)
                        .onAppear {
                            animate.toggle()
                        }
                        .padding(.bottom, 50) // Raise heart slightly

                    // Title and description
                    Text("What's the most logical next step?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                        
                    
                    Text("Press the button that best describes your next step.")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 30)

                    // Grid of buttons (centered and raised)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(categories, id: \.0) { category in
                            NavigationLink(destination: destinationView(for: category.0)) {
                                VStack {
                                    Text(category.0)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding(.bottom, 5)
                                    
                                    Text(category.1)
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                }
                                .padding()
                                .frame(width: 150, height: 150)
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal, 170) // Adjust horizontal padding
                    .padding(.bottom, 20) // Adjust vertical padding
                    
                    Spacer() // Push content up
                }
            }
        }
    }

    @ViewBuilder
    private func destinationView(for category: String) -> some View {
        // Map the categories to GainBrainView for now
        switch category {
        case "1", "2", "3", "4":
            GainBrainView() // Navigate to GainBrainView
        default:
            Text("Unknown Category")
        }
    }
}


#Preview {
    PsyScene1AnswerView()
}
