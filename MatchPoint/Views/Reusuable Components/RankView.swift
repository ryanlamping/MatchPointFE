//
//  RankView.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 11/7/24.
//
// case rank
// case movement
// case points

import SwiftUI

struct RankView: View {
    // var rank: AtpRanking
    
    var body: some View {
            HStack {
                // rank.rank
                Text("2")
                    .font(.title)
                    .foregroundColor(Color(hex: "E1E587"))
                // replace alcaraz_head with uniform name of image
                CirclePhoto(image: Image("alcaraz_head_2024"))
                    .frame(width: 60, height: 60)
                // rank.competitor.name
                Text("Carlos Alcaraz")
                    .foregroundColor(Color(hex: "E1E587"))
                // rank.competitor.age
                Text("21")
                    .foregroundColor(Color(hex: "E1E587"))
                // rank.points
                Text("6,580")
                    .foregroundColor(Color(hex: "E1E587"))
                // difference
                Text("-1,00")
                    .foregroundColor(Color(hex: "E1E587"))
                // rank.movement
                Text("-1")
                    .foregroundColor(Color(hex: "E1E587"))
                
                Image(systemName: "star.fill")
                    .foregroundColor(Color(hex: "E1E587"))
            }
            .padding()
            .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "E1E587"), lineWidth: 2)
                    )
    }
}

#Preview {
    RankView()
}
