//
//  JCVScroll.swift
//
//  Created by Pericles Terto da Silva Junior on 20/02/18.
//  Copyright © 2018 PericlesJr. All rights reserved.
//

import UIKit

open class JCVScroll {
  
  public static var fadeColor: UIColor = UIColor.black
  public static var fadeAnimationSpeed: CGFloat = 1
    
  static private var previousScrollOffset: CGFloat = 0
  static private let shadowTag: Int = 728
  static private let shadowView: UIView = UIView()
  
  public static func setup(for views: [UIView], scrollView: UIScrollView, viewConstraints: [NSLayoutConstraint]) {
    
    var currentIndex: Int?
    
    let scrollDiff = scrollView.contentOffset.y - previousScrollOffset
    let scrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > 0
    let scrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height)
    
    if scrollingDown {
      for i in 0..<viewConstraints.count {
        if abs(viewConstraints[i].constant) < views[i].bounds.height {
          currentIndex = i
          break
        }
      }
    }
    
    if scrollingUp {
      if currentIndex == nil {
        for i in (0..<viewConstraints.count).reversed() {
          if abs(viewConstraints[i].constant) > 0 {
            currentIndex = i
            break
          }
        }
      }
    }
    guard let index = currentIndex else { return }
    setupCollapsable(view: views[index], scrollView: scrollView, viewConstraint: viewConstraints[index])
  }
  
  static private func setupCollapsable(view: UIView, scrollView: UIScrollView, viewConstraint: NSLayoutConstraint) {
    if view.viewWithTag(shadowTag) == nil {
      shadowView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      shadowView.alpha = 0
      shadowView.backgroundColor = fadeColor
      shadowView.tag = shadowTag
      view.addSubview(shadowView)
    }
    
    let scrollDiff = scrollView.contentOffset.y - previousScrollOffset
    let absoluteTop: CGFloat = 0
    let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height
    let scrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
    let scrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom
    
    var newHeight = viewConstraint.constant
    
    if scrollingDown {
      newHeight = max(-view.bounds.height, viewConstraint.constant - abs(scrollDiff))
    } else if scrollingUp {
      newHeight = min(0, viewConstraint.constant + abs(scrollDiff))
    }
    
    if newHeight != viewConstraint.constant {
      viewConstraint.constant = newHeight
      shadowView.alpha = abs(newHeight/(-view.bounds.height*fadeAnimationSpeed))
      scrollView.contentOffset = CGPoint(x: scrollView.contentOffset.x, y: previousScrollOffset)
    }
    previousScrollOffset = scrollView.contentOffset.y
  }
  
}
