# JCVScroll
JCVScroll is a Swift class that contains a set of methods to create collapsable UIViews like CollapsingToolbar on Android.

![Arrow](https://github.com/Pelvs/JCVScroll/blob/master/Exampple.gif)

## Getting Started
You can easily start using this tool by adding it to your project using Cocoapods, Carthage or simply adding the source JCVScroll class into the project.

#### Using Cocoapods
```
pod 'JCVScroll'
```
#### Using Carthage
```
github "********"
```
#### Manually
add JCVScroll.swift into your project.

## How to use
Import JCVScroll into your class:
```
import JCVScroll
```
There is two properties you can set for the collapsing animation:
- Fade color (Default value is UIColor.clear)
```swift
fadeColor = UIColor.black
```
- Fade Speed, smaller fadeAnimationSpeed values means faster fade animations (Default value is 1).
```swift
fadeAnimationSpeed = 1    /* can set this value from 0.0 to 1.0 */
```
JCVScroll can handle as many views you need to collapse:
```swift
  setup(for views: [UIView], scrollView: UIScrollView, viewConstraints: [NSLayoutConstraint])
```
Where:
- view - Views that will be collapse.
- scrollView - Scrollable component from the view.
- viewConstraint - Top constraint from each collapsable view.
* [UIView] and [NSLayoutConstraint] must be in the same order.
#### Example:
```swift
let views: [UIView] = [view1, view2, view3]
let viewConstraints: [NSLayoutConstraint] = [topConstraintFromView1, topConstraintFromView2, topConstraintFromView3]

JCVScroll.setup(for: views, scrollView: scrollView, viewConstraints: viewConstraints)
```
#### IMPORTANT: Both methods needs to be added into the delegate method scrollViewDidScroll
Can be used on ScrollViews, TableViews or CollectionViews.
