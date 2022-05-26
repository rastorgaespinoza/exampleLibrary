//
//  CustomStyle.swift
//  
//
//  Created by Rodrigo Astorga on 23-05-22.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct CustomStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  private var style: ConfigurationButtonStyle

  init(style: ConfigurationButtonStyle) {
    self.style = style
  }

  func backgroundColor(isPressed: Bool) -> Color {
    if isEnabled {
      return isPressed ? style.isPressedBackgroundColor : style.backgroundColor
    } else {
      return style.disableBackgroundColor
    }
  }

  var foregroundColor: Color {
    return isEnabled ? style.foregroundColor : style.disableForegroundColor
  }

  var borderColor: Color {
    return isEnabled ? style.borderColor : style.disableBackgroundColor
  }

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .minimumScaleFactor(0.3)
      .padding(.vertical, style.verticalPadding)
      .padding(.horizontal, style.horizontalPadding)
      .frame(height: style.height)
      .if(!style.isSmall, transform: { view in
        view.frame(maxWidth: style.width ?? .infinity)
      })
      .background(backgroundColor(isPressed: configuration.isPressed))
      .foregroundColor(foregroundColor)
      .cornerRadius(style.cornerRadius)
      .overlay(
        RoundedRectangle(cornerRadius: style.cornerRadius)
          .strokeBorder(borderColor, lineWidth: style.borderWidth)
      )
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}
