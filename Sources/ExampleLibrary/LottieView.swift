//
//  File.swift
//  
//
//  Created by Rodrigo Astorga on 23-05-22.
//
//
//import Lottie
//import SwiftUI
//
//public struct LottieView: UIViewRepresentable {
//  private let animationView = AnimationView()
//  let filename: String
//  @Binding var show: Bool
//
//  public init(filename: String, show: Binding<Bool>) {
//    self.filename = filename
//    self._show = show
//  }
//
//  public func makeUIView(context _: UIViewRepresentableContext<LottieView>) -> UIView {
//    let view = UIView(frame: .zero)
//    let animation = Animation.named(filename)
//    animationView.animation = animation
//    animationView.contentMode = .scaleAspectFit
//    animationView.loopMode = .loop
//
//    animationView.play { status in
//      if status {
//        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
//          show.toggle()
//        }
//      }
//    }
//
//    animationView.translatesAutoresizingMaskIntoConstraints = false
//    view.addSubview(animationView)
//
//    NSLayoutConstraint.activate([
//      animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
//      animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
//    ])
//
//    return view
//  }
//
//  public func updateUIView(_: UIView, context _: UIViewRepresentableContext<LottieView>) {
//    animationView.play()
//  }
//}
