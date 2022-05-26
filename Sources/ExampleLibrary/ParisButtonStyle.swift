//
//  ParisButtonStyle.swift
//  
//
//  Created by Rodrigo Astorga on 19-05-22.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ParisButtonStyle: PrimitiveButtonStyle {
  @Binding var isLoading: Bool
  private var style: ConfigurationButtonStyle

  public init(
    _ style: ConfigurationButtonStyle = .primaryStyle,
    isLoading: Binding<Bool>
  ) {
    self.style = style
    self._isLoading = isLoading
  }

  public func makeBody(configuration: Configuration) -> some View {
    return Button(action: {
      if !isLoading {
        configuration.trigger()
      }
    }) {
      if isLoading {
        #if !os(iOS)
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle(tint: style.foregroundColor))
        #else
          LoadingDotsBouncing()
//          LottieView(filename: "loading-button", show: .constant(true))
        #endif
      } else {
        configuration.label
      }
    }
    .buttonStyle(CustomStyle(style: style))
  }
}

#if DEBUG
struct ButtonStyles_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      primaryGroup

      Divider()

      secondaryGroup

      Divider()

      outlineGroup
    }
  }

  static var primaryGroup: some View {
    Group {
      Button("primary style small") {}
      .buttonStyle(ParisButtonStyle(.primaryStyleSmall, isLoading: .constant(false)))

      Button("primary style small") {}
      .buttonStyle(ParisButtonStyle(.primaryStyleSmall, isLoading: .constant(false)))
      .disabled(true)

      Button("primary style") {}
      .buttonStyle(ParisButtonStyle(.primaryStyle, isLoading: .constant(false)))

      Button("primary style loading") {}
      .buttonStyle(ParisButtonStyle(.primaryStyle, isLoading: .constant(true)))

      Button("primary style disabled") {}
      .buttonStyle(ParisButtonStyle(.primaryStyle, isLoading: .constant(false)))
      .disabled(true)
    }
  }

  static var secondaryGroup: some View {
    Group {
      Button("secondary style small") {}
      .buttonStyle(ParisButtonStyle(.secondaryStyleSmall, isLoading: .constant(false)))

      Button("secondary style small disabled") {}
      .buttonStyle(ParisButtonStyle(.secondaryStyleSmall, isLoading: .constant(false)))
      .disabled(true)

      Button("secondary style") {}
      .buttonStyle(ParisButtonStyle(.secondaryStyle, isLoading: .constant(false)))

      Button("secondary style loading") {}
      .buttonStyle(ParisButtonStyle(.secondaryStyle, isLoading: .constant(true)))

      Button("secondary style disabled") {}
      .buttonStyle(ParisButtonStyle(.secondaryStyle, isLoading: .constant(false)))
      .disabled(true)
    }
  }

  static var outlineGroup: some View {
    Group {
      Button("Action") {}
      .buttonStyle(ParisButtonStyle(.outlineSmall, isLoading: .constant(false)))

      Button("Action") {}
      .buttonStyle(ParisButtonStyle(.outlineSmall, isLoading: .constant(false)))
      .disabled(true)

      Button("Action") {}
      .buttonStyle(ParisButtonStyle(.outline, isLoading: .constant(false)))

      Button("Action") {}
      .buttonStyle(ParisButtonStyle(.outline, isLoading: .constant(true)))

      Button("Action") {}
      .buttonStyle(ParisButtonStyle(.outline, isLoading: .constant(false)))
      .disabled(true)
    }
  }
}
#endif
