//
//  ViewModifier.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 6/19/24.
//

import Foundation
import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "1E421D"))
            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func applyBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
}
