#
# Be sure to run `pod lib lint ZSExtensionSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZSExtensionSwift'
  s.version          = '0.1.2'
  s.summary          = '常用延展'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
开发中常用类的延展 （swift版）
                       DESC

  s.homepage         = 'https://github.com/TaylorsZ'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangs1992@126.com' => 'zhangs1992@126.com' }
  s.source           = { :git => 'https://github.com/TaylorsZ/ZSExtensionSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ZSExtensionSwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZSExtensionSwift' => ['ZSExtensionSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
