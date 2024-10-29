//
//  EditView.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 24/10/2024.
//

import SwiftUI

struct EditView: View {

    @State private var jobApplication = JobApplication(status: .wishlist, company: "", jobTitle: "", location: "", salary: 0, listingURL: "", dateApplied: Date(), followedUp: false, notes: "")

    
    var body: some View {
        Form {
            Picker("Status", selection: $jobApplication.status) {
                ForEach(JobApplication.Status.allCases) { option in
                    Text(String(describing: option))
                
                }
            }
            .pickerStyle(.segmented)
            TextField("Company", text: $jobApplication.company)
            TextField("Job Title", text: $jobApplication.jobTitle)
            TextField("Location", text:$jobApplication.location)
            TextField("Salary", value: $jobApplication.salary, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                .keyboardType(.numberPad)
            TextField("Listing URL", text: $jobApplication.listingURL)
                .keyboardType(.URL)
                .textContentType(.URL)
            DatePicker("Date Applied", selection: $jobApplication.dateApplied, displayedComponents: .date)
            Toggle("Followed up?", isOn: $jobApplication.followedUp)
            Section("Notes") {
                TextField("Notes", text: $jobApplication.notes, axis: .vertical)
            }
        }
    }
}

#Preview {
    EditView()
}
