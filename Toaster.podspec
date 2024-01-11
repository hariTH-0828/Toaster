#
# Be sure to run `pod lib lint Toaster.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Toaster'
  s.version          = '0.1.0'
  s.summary          = 'This toaster lib is used to display success and failed toast in UIViewController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This toaster lib is used to display success and failed toast in UIViewController. Install library into project, never have to write this generic code again!
                       DESC

  s.homepage         = 'https://github.com/hariTH-0828/Toaster'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hariTH-0828' => 'hariharan08112001@gmail.com' }
  s.source           = { :git => 'https://github.com/hariTH-0828/Toaster.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.source_files = 'Toaster/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Toaster' => ['Toaster/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'SnapKit', '~>5.6.0'
end
