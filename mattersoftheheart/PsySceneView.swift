//
//  PsySceneView.swift
//  mattersoftheheart
//
//  Created by Dominique Escoe on 1/28/25.
//

import SwiftUI

struct PsyScene1View: View {
    @State private var navigateToAnswerView = false // Tracks navigation state

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white // Background color
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Title of the view
                    Text("Level 1")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()

                    // Image Content
                    Image("8") // Replace "sceneImage" with your asset name
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()

                    // Description text
                    Text("""
                    You and your best friend, Emily, have been inseparable for years. Today, you’re hanging out at the park, laughing and playing games on your phone. Suddenly, you get a notification about suspicious activity on your account. Alarmed, you check and discover your account has been hacked. After some investigation, you realize the hacker is none other than Emily.
                    """)
                        .font(.body)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()

                    Spacer()

                    // Heart Icon as a Next Button
                    HStack {
                       
                            
                            
                            Spacer()
                        VStack {
                            Button(action: {
                                navigateToAnswerView = true // Navigate to PsyScene1AnswerView
                            }) {
                                Image("1") // Replace "heartIcon" with your heart icon asset name
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .padding()
                            }
                                Text("Next")
                            
                        }
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
            }
            .navigationDestination(isPresented: $navigateToAnswerView) {
                PsyScene1AnswerView() // Destination view
            }
        }
    }
}


#Preview {
    PsyScene1View()
}
