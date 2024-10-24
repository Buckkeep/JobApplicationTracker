//
//  JobApplications.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 24/10/2024.
//

import Foundation

struct JobApplications {
    enum Status {
        case wishlist, pending, denied, other
    }
    
    var status: Status
    var company: String
    var jobTitle: String
    var location: String
    var salary: String
    var listingURL: String
    var dateApplied: Date
    var followedUp: Bool
    var notes: String
    
    init(status: Status, company: String, jobTitle: String, location: String, salary: String, listingURL: String, dateApplied: Date, followedUp: Bool, notes: String) {
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
}
