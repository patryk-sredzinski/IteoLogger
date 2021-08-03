Pod::Spec.new do |spec|
  spec.name                  = 'IteoLogger'
  spec.version               = '1.0.4'
  spec.license               = { :type => 'MIT' }
  spec.homepage              = 'https://github.com/psredzinski/IteoLogger'
  spec.authors               = { 'Patryk Średziński' => 'patryk.sredzinski@iteo.com' }
  spec.summary               = 'Logger library with an option to share logs and display them in live app.'
  spec.source                = { :git => 'https://github.com/psredzinski/IteoLogger.git', :tag => '1.0.0' }
  spec.source_files          = 'IteoLogger/*.{swift,xib}', 'IteoLogger/**/*.{swift,xib}', 'IteoLogger/**/**/*.{swift,xib}', 'IteoLogger/**/**/**/*.{swift,xib}'
  spec.resources             = "IteoLogger/*.{xcassets}"
  spec.ios.deployment_target = '11.0'
  spec.osx.deployment_target = '11.0'
  spec.swift_versions        = ['5.1', '5.2', '5.3']
  spec.platform              = :ios, '11.0'
end
