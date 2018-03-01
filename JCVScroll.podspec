#
# Be sure to run `pod lib lint JCVScroll.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCVScroll'
  s.version          = '1.0.0'
  s.summary          = 'Collapsing view helper'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
JCVScroll is a class made in Swift that helps to create collapsing views on iOS just like collapsingToolbar on Android.
                       DESC

  s.homepage         = 'https://github.com/Pelvs/JCVScroll'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pelvs' => 'pericles-terto@hotmail.com' }
  s.source           = { :git => 'https://github.com/Pelvs/JCVScroll.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'JCVScroll/Classes/**/*'
end
