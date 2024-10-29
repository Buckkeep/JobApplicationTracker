//
//  JobApplications.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 24/10/2024.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class JobApplication {
    enum Status: CaseIterable, Identifiable, CustomStringConvertible {
        var id: Self {self}
        
        case wishlist, pending, denied, offer
        
        var description: String {
            switch self {
            case .wishlist:
                return "Wishlist"
            case .pending:
                return "Pending"
            case .denied:
                return "Denied"
            case .offer:
                return "Offer"
            }
        }
        
        var colour: some View {
            switch self {
            case .wishlist:
                Color.blue
            case .pending:
                Color.yellow
            case . denied:
                Color.red
            case .offer:
                Color.green
            }
        }
    }
    
    var status: Status = .wishlist
    var company: String = ""
    var jobTitle: String = ""
    var location: String = ""
    var salary: Int = 0
    var listingURL: String = ""
    var dateApplied: Date = Date()
    var followedUp: Bool = false
    var notes: String = ""
    
    init(status: Status, company: String, jobTitle: String, location: String, salary: Int, listingURL: String, dateApplied: Date, followedUp: Bool, notes: String) {
        self.status = status
        self.company = company
        self.jobTitle = jobTitle
        self.location = location
        self.salary = salary
        self.listingURL = listingURL
        self.dateApplied = dateApplied
        self.followedUp = followedUp
        self.notes = notes
    }
    
    #if DEBUG
    static let example = JobApplication(status: .pending, company: "NatWest", jobTitle: "Developer", location: "London", salary: 50000, listingURL: "https://www.natwest.com", dateApplied: Date(), followedUp: true, notes: "I work here")
    #endif
}
