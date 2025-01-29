//
//  ChooseNewPath.swift
//  mattersoftheheart
//
//  Created by Dominique Escoe on 1/28/25.
//

import SwiftUI

struct ChoosePathView: View {
    @State private var selectedCategory: String? // Tracks the selected category for navigation
    @State private var animate = false // State variable to track animation

    let categories = [
        ("Work", "Navigating workplace challenges and relationships."),
        ("Betrayal", "Handling trust issues and overcoming betrayal."),
        ("Romance", "Balancing emotions and logic in love."),
        ("Psychological", "Developing resilience, mindfulness, and self-awareness.")
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack {
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .scaleEffect(animate ? 1.2 : 1.0)
                        .opacity(animate ? 0.7 : 1.0)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animate)
                        .onAppear {
                            animate.toggle()
                        }

                    Text("Choose Your Path:")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)

                    Text("Which area of life would you like to focus on first?")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(categories, id: \ .0) { category in
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
                    .padding()
                }
            }
        }
    }

    @ViewBuilder
    private func destinationView(for category: String) -> some View {
        switch category {
        case "Work":
            WorkScene1View()
        case "Betrayal":
            BetrayalScene1View()
        case "Romance":
            RomanceSceneView1()
        case "Psychological":
            PsyScene1View()
        default:
            Text("Unknown Category")
        }
    }
}

// Placeholder Views
struct WorkScene1View: View {
    var body: some View {
        Text("Work Scene 1")
    }
}

struct BetrayalScene1View: View {
    var body: some View {
        Text("Betrayal Scene 1")
    }
}

struct RomanceSceneView1: View {
    var body: some View {
        Text("Romance Scene 1")
    }
}



#Preview {
    ChoosePathView()
}
