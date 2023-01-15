#
#  Be sure to run `pod spec lint GenericUserDefaults.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "GenericUserDefaults"
  spec.version      = "1.0.0"
  spec.summary      = "A generic UserDefaults wrapper."
  spec.description  = "GenericUserDefaults is a wrapper around the UserDefaults object to make properties accessible without having to paste the string keys everywhere throughout your project. It allows you to set and get values from the user defaults from anywhere."

  spec.homepage     = "https://github.com/lc-asad/GenericUserDefaults"
  spec.license      = "MIT"
  spec.author       = { "Asad Ullah" => "asad_622@hotmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/lc-asad/GenericUserDefaults.git", :tag => "1.0.0" }
  spec.source_files  = "GenericUserDefaults/**/*"
  # spec.exclude_files = "Classes/Exclude"
  # spec.public_header_files = "Classes/**/*.h"
  # spec.dependency "JSONKit", "~> 1.4"
end
