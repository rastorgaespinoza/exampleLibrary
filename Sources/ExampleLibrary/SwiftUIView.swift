//
//  SwiftUIView.swift
//  
//
//  Created by Rodrigo Astorga on 19-05-22.
//

import SwiftUI

@available(iOS 14, macOS 11.0, *)
struct SwiftUIView: View {
  var body: some View {
    Button {
      print("")
    } label: {
      Text("hola mundo")
    }
    Text("Hola mundo 2")

  }
}

@available(iOS 14, macOS 11.0, *)
public struct ParisPrimaryStyle: ButtonStyle {
  var isBlue: Bool = true
  var enabled = true
  var withPadding = true
  var minHeight: CGFloat = 46
  var maxHeight: CGFloat = 48

  var backgroundColor: Color {
      return enabled ? Color.black : Color.white
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