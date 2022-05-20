//
//  SwiftUIView 2.swift
//  
//
//  Created by Rodrigo Astorga on 19-05-22.
//

import SwiftUI

public struct ParisButton<Content: View>: View{
  @Binding var isLoading: Bool

  var style: ParisButtonStyle
  let content: Content
  var action: () -> Void = {}

  public init(action: @escaping () -> Void, isLoading: Binding<Bool>, style: ParisButtonStyle? = nil, @ViewBuilder builder: () -> Content) {
    self._isLoading = isLoading
    self.style = style ?? ParisButtonStyle()
    content = builder()
    self.action = action
  }

  public var body: some View {
    Button(action: {
      if !isLoading {
        action()
      }
    }) {
      if isLoading {
        ProgressView()
      } else {
        content
      }
    }
//    .frame(width: style.width, height: style.height)
    .buttonStyle(ParisPrimaryStyle())
    .disabled(isLoading)
    .animation(.easeInOut, value: isLoading)
  }
}

struct SwiftUIView_2_Previews: PreviewProvider {
  static var previews: some View {
    ParisButton(action: {}, isLoading: .constant(false), builder: {
      Text("hola mundo")
    })
  }
}
