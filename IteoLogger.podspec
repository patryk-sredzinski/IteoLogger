Pod::Spec.new do |spec|
  spec.name                  = 'IteoLogger'
  spec.version               = '1.3'
  spec.license               = { :type => 'MIT' }
  spec.homepage              = 'https://github.com/psredzinski/IteoLogger'
  spec.authors               = { 'Patryk Średziński' => 'patryk.sredzinski@iteo.com' }
  spec.summary               = 'Logger library with an option to share logs and display them in live app.'
  spec.source                = { :git => 'https://github.com/psredzinski/IteoLogger.git' }
  spec.source_files          = 'IteoLogger/*.{swift}', 'IteoLogger/**/*.{swift}', 'IteoLogger/**/**/*.{swift}', 'IteoLogger/**/**/**/*.{swift}'
  spec.resources             = 'IteoLogger/*.{xcassets}', 'IteoLogger/*.{xib}', 'IteoLogger/**/*.{xib}', 'IteoLogger/**/**/*.{xib}', 'IteoLogger/**/**/**/*.{xib}'
  spec.ios.deployment_target = '13.0'
  spec.osx.deployment_target = '13.0'
  spec.swift_versions        = ['5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7']
  spec.platform              = :ios, '13.0'
end
