#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint open_file_plus.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'open_file_plus'
  s.version          = '0.0.1'
  s.summary          = 'A plug-in that can call native APP to open files with string result in flutter, support iOS(DocumentInteraction) / android(intent) / PC(ffi) / web(dart:html)'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/joutvhu/open_file_plus'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'joutvhu' => 'joutvhu@gmail.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
