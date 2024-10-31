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
    
    var viewModel = ViewModel()
    
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
                
                Section {
                    HStack {
                        Text("Current Applications")
                            .fontWeight(.bold)
                        Spacer()
                        EditButton()
                    }
                    .padding()
                    List {
                        ForEach(viewModel.jobApplications) { jobApplication in
                            ListRowView(jobApplication: jobApplication)
                        }
                        .onDelete(perform: viewModel.deleteItem)
                        .onMove(perform: viewModel.moveItem)
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
    

}

#Preview {
    ContentView()
}


