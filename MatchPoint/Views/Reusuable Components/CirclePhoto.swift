//
//  CirclePhoto.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 11/7/24.
//

import SwiftUI

struct CirclePhoto: View {
    var image: Image
    var body: some View {
        image
            .resizable()  // Ensure the image can scale
            .scaledToFit() // Maintain aspect ratio
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4.0)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CirclePhoto(image: Image("alcaraz_head_2024"))
}
