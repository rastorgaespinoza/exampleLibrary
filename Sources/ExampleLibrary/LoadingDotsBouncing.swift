//
//  LoadingDotsBouncing.swift
//  
//
//  Created by Rodrigo Astorga on 26-05-22.
//

import Combine
import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct LoadingDotsBouncing: View {
  @State var counter = 0
  let numberOfDots: Int
  let primaryColor: Color
  let currentBouncingColor: Color
  let timer: Publishers.Autoconnect<Timer.TimerPublisher>
  let timing: Double

  init(
    numberOfDots: Int = 3,
    primaryColor: Color = .white,
    currentBouncingColor: Color = .cyanAnimation,
    speed: Double = 0.7
  ) {
    self.numberOfDots = numberOfDots
    self.primaryColor = primaryColor
    self.currentBouncingColor = currentBouncingColor
    timing = speed / 2
    timer = Timer.publish(every: timing, on: .main, in: .common).autoconnect()
  }

  var body: some View {
    Color.clear
      .aspectRatio(2.5, contentMode: .fit)
//      .padding(.vertical, 12)
      .overlay(bouncingDots)

  }

  private var bouncingDots: some View {
    HStack(spacing: 10) {
      ForEach(0..<numberOfDots) { index in
        GeometryReader { proxy in
          Circle()
            .offset(y: counter == index ? -proxy.size.height / 10 : proxy.size.height / 10)
            .fill(counter == index ? currentBouncingColor : primaryColor)
        }
      }
    }
    .onReceive(timer, perform: { _ in
      withAnimation(.easeInOut(duration: timing * 2)) {
        counter = counter == (numberOfDots - 1) ? 0 : counter + 1
      }
    })
  }
}
