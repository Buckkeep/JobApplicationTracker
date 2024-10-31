//
//  ContentViewModel.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 31/10/2024.
//

import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        var jobApplications: [JobApplication] = []
        
        init() {
            getItems()
        }
        
        func getItems() {
            let newJobApplications =  [
                JobApplication(status: .pending, company: "Bank 1", jobTitle: "Developer", location: "London", salary: 60000, listingURL: "https://www.bank1.com", dateApplied: Date(), followedUp: true, notes: "First interview"),
                JobApplication(status: .denied, company: "Muppet Inc", jobTitle: "Muppet", location: "Sesame Street", salary: 45000, listingURL: "Website here", dateApplied: Date(), followedUp: true, notes: "Muppets!"),
                JobApplication(status: .offer, company: "NatWest", jobTitle: "Engineer", location: "London", salary: 51000, listingURL: "www.natwest.com", dateApplied: Date(), followedUp: true, notes: "Woo hoo!"),
                JobApplication(status: .wishlist, company: "Nintendo", jobTitle: "Pokemon Trainer", location: "Tokyo", salary: 70000, listingURL: "www.pokemon.com", dateApplied: Date(), followedUp: true, notes: "Gotta catch 'em all.")
            ]
            jobApplications.append(contentsOf: newJobApplications)
        }
        
        func deleteItem(indexSet: IndexSet) {
            jobApplications.remove(atOffsets: indexSet)
        }
        
        func moveItem(from: IndexSet, to: Int) {
            jobApplications.move(fromOffsets: from, toOffset: to)
        }
    }
}
