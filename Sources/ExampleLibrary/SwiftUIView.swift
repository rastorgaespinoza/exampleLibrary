//
//  SwiftUIView.swift
//  
//
//  Created by Rodrigo Astorga on 19-05-22.
//

import SwiftUI

struct SwiftUIView: View {
  var body: some View {
#if os(iOS)
    Button {
      print("")
    } label: {
      Text("hola mundo")
    }
#endif
    Text("Hola mundo 2")

  }
}

public struct ParisPrimaryStyle: ButtonStyle {
  var isBlue: Bool
  var enabled = true
  var withPadding = true
  var minHeight: CGFloat = 46
  var maxHeight: CGFloat = 48

  var backgroundColor: Color {
      return enabled ? Color.cyan : Color.white
  }

  var foregroundColor: Color {
    return enabled ? Color.white : .gray
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background(backgroundColor)
      .foregroundColor(foregroundColor)
      .cornerRadius(24)
      .overlay(
        RoundedRectangle(cornerRadius: 24)
          .strokeBorder(foregroundColor, lineWidth: 1)
      )
  }
}
