//
//  AtpRankingsView.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 9/15/24.
//

import SwiftUI

struct AtpRankingsView: View {
    @State private var live = false
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Text("Rankings")
                    .font(.title)
                    .foregroundColor(Color(hex: "E1E587"))
                    .padding()
                HStack {
                    AnimatedDropdownMenu()
                        .containerRelativeFrame(.horizontal) { length, _ in
                            return length/2
                        }
                    Spacer()
                    Toggle("Live", isOn: $live)
                        .toggleStyle(SwitchToggleStyle(tint: Color(hex: "E1E587")))
                        .foregroundColor(Color(hex: "E1E587"))
                        .containerRelativeFrame(.horizontal) { length, _ in
                            return length/4
                        }
                }
                RankView()
            }
            .padding()
        }
        .applyBackground()
    }
}

#Preview {
    AtpRankingsView()
}
