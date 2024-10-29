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
    @State private var students = ["Harry", "Ron", "Hermione", "Draco", "Crabbe", "Goyle", "Pansy", "Parvati", "Padma"]
    @State var isEditing: Bool = false
    
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
                
                Spacer()
                Rectangle()
                    .frame(width: .infinity, height: 2)
                    .foregroundStyle(.gray)
                Section("Current applications") {
                    HStack {
                        EditButton()
                        .padding()
                        Spacer()
                    }
                    List {
                        ForEach(students, id: \.self) { student in
                            Text(student)
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: { indices, newOffset in
                            students.move(fromOffsets: indices, toOffset: newOffset)
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
        students.remove(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
}
