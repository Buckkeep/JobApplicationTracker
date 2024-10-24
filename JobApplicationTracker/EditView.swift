//
//  EditView.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 24/10/2024.
//

import SwiftUI

struct EditView: View {

//    @State private var statusOption: Status = .wishlist
    
    @State private var viewModel = ViewModel(status: .wishlist, company: "", jobTitle: "", location: "", salary: 0, listingURL: "", dateApplied: Date(), followedUp: false, notes: "")
    
    var body: some View {
        Form {
            Picker("Status", selection: $viewModel.status) {
                ForEach(EditView.ViewModel.Status.allCases) { option in
                    Text(String(describing: option))
                
                }
            }
            .pickerStyle(.segmented)
            TextField("Company", text: $viewModel.company)
            TextField("Job Title", text: $viewModel.jobTitle)
            TextField("Location", text:$viewModel.location)
            TextField("Salary", value: $viewModel.salary, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                .keyboardType(.numberPad)
            TextField("Listing URL", text: $viewModel.listingURL)
                .keyboardType(.URL)
                .textContentType(.URL)
            DatePicker("Date Applied", selection: $viewModel.dateApplied, displayedComponents: .date)
            Toggle("Followed up?", isOn: $viewModel.followedUp)
            Section("Notes") {
                TextField("Notes", text: $viewModel.notes, axis: .vertical)
            }
        }
    }
}

#Preview {
    EditView()
}
