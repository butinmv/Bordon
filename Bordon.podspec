Pod::Spec.new do |s|
  s.name             = 'Bordon'
  s.version          = '1.0.0'
  s.summary          = 'Onboarding library'
  s.homepage         = 'https://github.com/butinmv/Bordon.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Maxim Butin' => 'butinmv9722@gmail.com' }
  s.source           = { :git => 'https://github.com/butinmv/Bordon.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/Bordon/**/*'
end
