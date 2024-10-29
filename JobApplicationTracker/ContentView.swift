//
//  ContentView.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
    let statusOptions = JobApplication.Status.allCases
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var jobApplications: [JobApplication] = [
        JobApplication(status: .pending, company: "Bank 1", jobTitle: "Developer", location: "London", salary: 60000, listingURL: "https://www.bank1.com", dateApplied: Date(), followedUp: true, notes: "First interview"),
        JobApplication(status: .denied, company: "Muppet Inc", jobTitle: "Muppet", location: "Sesame Street", salary: 45000, listingURL: "Website here", dateApplied: Date(), followedUp: true, notes: "Muppets!"),
        JobApplication(status: .offer, company: "NatWest", jobTitle: "Engineer", location: "London", salary: 51000, listingURL: "www.natwest.com", dateApplied: Date(), followedUp: true, notes: "Woo hoo!"),
        JobApplication(status: .wishlist, company: "Nintendo", jobTitle: "Pokemon Trainer", location: "Tokyo", salary: 70000, listingURL: "www.pokemon.com", dateApplied: Date(), followedUp: true, notes: "Gotta catch 'em all.")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    LazyVGrid(columns: columns) {
                        ForEach(statusOptions) { item in
                            Button {
                                // filter action here
                            }
                            label: {
                                Text(item.description)
                                    .frame(width: 150, height: 150)
                                    .background(item.colour)
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                                    .padding(10)
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                            }
                        }
                        
                    }
                }
                .padding()
                .background(Color(.lightGray))
                
                Section("Current applications") {
                    HStack {
                        EditButton()
                        .padding()
                        Spacer()
                    }
                    List {
                        ForEach(jobApplications) { jobApplication in 
                            ListRowView(jobApplication: jobApplication)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: { indices, newOffset in
                            jobApplications.move(fromOffsets: indices, toOffset: newOffset)
                        })
                    }
                }
            }
            .navigationTitle("Job Applications")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: SettingsView()) {
                        Button("New Item", systemImage: "gear") {
                            print("Settings")
                        }
                    }
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: EditView()) {
                        Button("New Item", systemImage: "plus.circle") {
                            print("New Item")
                        }
                    }
                }
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        jobApplications.remove(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
}


