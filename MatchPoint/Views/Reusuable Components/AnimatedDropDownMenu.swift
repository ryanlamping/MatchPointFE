//
//  AnimatedDropDownMenu.swift
//  MatchPoint
//
//  Created by Ryan Lamping on 11/5/24.
//

import SwiftUI

struct AnimatedDropdownMenu: View {
  @Namespace private var animationNamespace
  @State private var isExpanded = false
  @State private var selectedOption = "ATP"
  let options = ["ATP", "WTA"]

  var body: some View {
    VStack {
        // button to expand drop down
      Button(action: {
        withAnimation(.spring()) {
          isExpanded.toggle()
        }
      }) {
        HStack {
          Text(selectedOption)
                .foregroundColor(Color(hex: "E1E587"))
          Spacer()
          Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                .foregroundColor(Color(hex: "E1E587"))
        }
        .padding()
        .background(Color.clear)
        .cornerRadius(8)
        .matchedGeometryEffect(id: "dropdown", in: animationNamespace)
      }

      if isExpanded {
              VStack {
                  ForEach(options, id: \.self) { option in
                      if option != selectedOption {
                          Text(option)
                              .padding()
                              .foregroundColor(Color(hex: "E1E587"))
                              .frame(maxWidth: .infinity, alignment: .leading)
                              .background(Color.clear)
                              .onTapGesture {
                                  withAnimation(.spring()) {
                                      selectedOption = option
                                      isExpanded = false
                                  }
                              }
                              .matchedGeometryEffect(id: "dropdown-\(option)", in: animationNamespace)
                      }
                  }
              }
        .background(Color.clear)
        .cornerRadius(8)
        .transition(.scale)
      }
    }
    .padding()
  }

}

#Preview {
    AnimatedDropdownMenu()
}
