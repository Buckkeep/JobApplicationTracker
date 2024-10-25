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
    
    var body: some View {
        NavigationStack {
        VStack {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(statusOptions) { item in
                        Text(item.description)
                            .frame(width: 150, height: 150)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            .padding(10)
                    }
                }
            }
            .padding()
            
            Spacer()
            
            Section("Current applications") {
                List {
                    ForEach(0..<15) { _ in
                        Text("Zip a dee doo dah")
                    }
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



//ForEach(0..<2) { _ in
//    HStack {
//        ForEach(0..<2) { _ in
//            Button {
//                print("\(statusOptions)")
//            } label: {
//                ForEach(statusOptions) {
//                    option in
//                    Text("\(option)")
//                        .frame(width: 150, height: 150)
//                        .background(.red)
//                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
//                        .padding(10)
//                }
////                                Text("Click Me")
//            }
//        }
//    }
//}
