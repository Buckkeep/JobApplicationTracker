//
//  EditView-ViewModel.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 24/10/2024.
//

import Foundation

extension EditView {
    @Observable
    class ViewModel {
        
        enum Status: CaseIterable, Identifiable, CustomStringConvertible {
            var id: Self {self}
            
            case wishlist, pending, denied, offer
            
            var description: String {
                switch self {
                case .wishlist:
                    return "Wishlist"
                case .pending:
                    return "Pending"
                case . denied:
                    return "Denied"
                case .offer:
                    return "Offer"
                }
            }
        }
        
        var status: Status
        var company: String
        var jobTitle: String
        var location: String
        var salary: Int
        var listingURL: String
        var dateApplied: Date
        var followedUp: Bool
        var notes: String
        
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
    }
}
