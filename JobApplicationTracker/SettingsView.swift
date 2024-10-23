//
//  SettingsView.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 23/10/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        HStack {
            Image(decorative: "frodo")
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
            Text("Hello, I'm Frodo! 💍")
        }
        VStack {
            Text("I'm not the developer who made this app!")
            Text("The original developer is a very cool gal named Mikaela. I am re-making this app in SwiftUI as a personal challenge, to help my to learn.")
            Button("Twitter") {
                // More code to come
            }
            .buttonStyle(GrowingButton())
            Button("Instagram") {
                // More code to come
            }
            .buttonStyle(GrowingButton())
            Text("Do you need more applications? You can watch an ad to gain one more!")
            // Need a variable to store how many applications are in use
            Text("Total job applications:")
            // Need a variable to track how many applications are available
            Text("Used 1 out of 3 applications")
            Button("Increase Application Limit") {
                // More code to come
            }
            .buttonStyle(GrowingButton())
            Text("Get unlimited applications and any features to come in the future!")
            Button("Unlimited") {
                // More code to come
            }
            .buttonStyle(GrowingButton())
            Button("Restore Purchase") {
                // More code to come
            }
            .buttonStyle(GrowingButton())
            Text("If you're loving the app, please rate it on the App Store!")
            Button("Rate the App") {
                // More code to come
            }
            .buttonStyle(GrowingButton())
        }
    }
}

#Preview {
    SettingsView()
}
