require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/datso/react-native-pjsip.git" }
  s.source_files  = "ios/**/*.{h,m}"

  s.dependency 'React'
  s.preserve_paths        = "ios/new/VialerPJSIP.framework/*"
  s.public_header_files   = "ios/new/VialerPJSIP.framework/Versions/A/Headers/**/*.{h,hpp}"
  s.source_files		    = "ios/new/VialerPJSIP.framework/Versions/A/Headers/**/*.{h,hpp}"
  s.vendored_frameworks = 'ios/new/VialerPJSIP.framework'
  s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1',
    'USE_HEADERMAP' => 'NO',
  }
end
