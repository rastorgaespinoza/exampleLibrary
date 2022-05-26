//
//  ConfigurationButtonStyle.swift
//  
//
//  Created by Rodrigo Astorga on 19-05-22.
//

import SwiftUI

public struct ConfigurationButtonStyle {
  /// Width of button
  public var width: CGFloat?
  /// Height of button
  public var height: CGFloat

  public var verticalPadding: CGFloat

  public var horizontalPadding: CGFloat
  /// Corner radius of button
  public var cornerRadius: CGFloat
  /// Background color of button
  public var backgroundColor: Color
  /// isPressedBackgroundColor color of button
  public var isPressedBackgroundColor: Color
  /// Background color of button
  public var disableBackgroundColor: Color
  /// ForegroundColor color of button
  public var foregroundColor: Color
  /// DisableForegroundColor color of button
  public var disableForegroundColor: Color
  /// Width of border stroke of button
  public var borderWidth: CGFloat
  /// Color of border stroke
  public var borderColor: Color

  public var isSmall: Bool
  
  public init(
    width: CGFloat? = nil,
    height: CGFloat = 45,
    verticalPadding: CGFloat = 12,
    horizontalPadding: CGFloat = 20,
    cornerRadius: CGFloat = 24,
    backgroundColor: Color = .cyan,
    isPressedBackgroundColor: Color = .cyanStrong,
    disableBackgroundColor: Color = .pearlGray,
    foregroundColor: Color = .white,
    disableForegroundColor: Color = .darkGray,
    borderWidth: CGFloat = 1,
    borderColor: Color = .cyan,
    isSmall: Bool = false
  ) {
    self.width = width
    self.height = height
    self.verticalPadding = verticalPadding
    self.horizontalPadding = horizontalPadding
    self.cornerRadius = cornerRadius
    self.backgroundColor = backgroundColor
    self.isPressedBackgroundColor = isPressedBackgroundColor
    self.disableBackgroundColor = disableBackgroundColor
    self.foregroundColor = foregroundColor
    self.disableForegroundColor = disableForegroundColor
    self.borderWidth = borderWidth
    self.borderColor = borderColor
    self.isSmall = isSmall
  }
}

extension ConfigurationButtonStyle {
  public static let primaryStyle = ConfigurationButtonStyle()

  public static let primaryStyleSmall = ConfigurationButtonStyle(isSmall: true)
  
  public static let secondaryStyle = ConfigurationButtonStyle(
    backgroundColor: .indigo, isPressedBackgroundColor: .indigo, borderColor: .indigo
  )

  public static let secondaryStyleSmall = ConfigurationButtonStyle(
    backgroundColor: .indigo, isPressedBackgroundColor: .indigo, borderColor: .indigo, isSmall: true
  )
  
  public static let outline = ConfigurationButtonStyle(
    backgroundColor: .white, isPressedBackgroundColor: .white, foregroundColor: .cyan
  )

  public static let outlineSmall = ConfigurationButtonStyle(
    backgroundColor: .white, isPressedBackgroundColor: .white, foregroundColor: .cyan, isSmall: true
  )
}
