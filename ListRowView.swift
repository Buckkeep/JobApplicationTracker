//
//  ListRowView.swift
//  JobApplicationTracker
//
//  Created by Buhecha, Neeta (Trainee Engineer) on 29/10/2024.
//

import Foundation
import SwiftUI

struct ListRowView: View {
    let jobApplication: JobApplication
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(jobApplication.company)
                Text(jobApplication.status.description)
            }
            Spacer()
            Text(dateFormatter.string(from: jobApplication.dateApplied))
        }
    }
}

#Preview {
    ListRowView(jobApplication: .example)
}
