//
//  SwiftUIView.swift
//  
//
//  Created by Rodrigo Astorga on 19-05-22.
//

import SwiftUI

//struct ParisButton: View {
//  var isLoading = false
//  var isEnabled = true
//  var action: () -> Void
//  var label: () -> Label
//
//  var body: some View {
//    Button(
//      action: action,
//      label: label
//    )
//      .buttonStyle(ParisPrimaryStyle())
//  }
//}

public extension Foundation.Bundle {
  static let modulePackage = Bundle.module
}

@available(iOS 14, macOS 11.0, *)
public struct SwiftUIView: View {
  var isPrimary = true
  @State var isLoading = false

  public init() {
    isPrimary = true
  }

  public var body: some View {
    Button {
      print("hola mundo request")
      isLoading.toggle()
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("hola mundo response")
        self.isLoading.toggle()
      }
    } label: {
      Text("hola mundohola")
        .customFontBold()
    }
    .buttonStyle(ParisPrimaryStyle())
    .buttonStyle(DisableTapLoadingStyle(isLoading: $isLoading))

  }
}

public struct ParisButtonStyleWithTap: PrimitiveButtonStyle {
  @Binding private var isLoading: Bool

  public init(isLoading: Binding<Bool>) {
    self._isLoading = isLoading
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .onTapGesture {
        if !isLoading {
          configuration.trigger()
        }
      }
      .buttonStyle(ParisPrimaryStyle())
  }
}

@available(iOS 14, macOS 11.0, *)
public struct ParisPrimaryStyle: ButtonStyle {
  var isBlue = true
  var enabled = true
  var isSmall = true

  public init() {
    isBlue = true
    enabled = true
    isSmall = true
  }

  var backgroundColor: Color {
      return enabled ? Color.cyan : Color.white
  }

  var foregroundColor: Color {
    return enabled ? Color.white : .gray
  }

  var borderColor: Color {
    return enabled ? Color.cyan : .gray
  }


  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 12)
      .padding(.horizontal, 20)
      .if(!isSmall, transform: { view in
        view.frame(maxWidth: .infinity)
      })
      .background(backgroundColor)
      .foregroundColor(foregroundColor)
      .cornerRadius(24)
      .overlay(
        RoundedRectangle(cornerRadius: 24)
          .strokeBorder(borderColor, lineWidth: 1)
      )

  }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

@available(iOS 14, macOS 11.0, *)
public struct DisableTapLoadingStyle: PrimitiveButtonStyle {
  @Binding var isLoading: Bool

  public init(isLoading: Binding<Bool>) {
    self._isLoading = isLoading
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label.onTapGesture {
      if !isLoading {
        configuration.trigger()
      }
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      SwiftUIView()
        .previewLayout(PreviewLayout.fixed(width: 300, height: 500))
    }
}

extension View {
  func customFontBold() -> some View {
    registerFont(Montserrat.bold.rawValue, fileExtension: "ttf")
    let font = Font.custom(Montserrat.bold.rawValue, size: 14)
    return self.font(font)
  }
}

enum Montserrat: String {
  case bold = "Montserrat-Bold"
}

func registerFont(_ name: String, fileExtension: String) {
    guard let fontURL = Bundle.module.url(forResource: name, withExtension: fileExtension) else {
        print("No font named \(name).\(fileExtension) was found in the module bundle")
        return
    }

    var error: Unmanaged<CFError>?
    CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
    print(error ?? "Successfully registered font: \(name)")
}
