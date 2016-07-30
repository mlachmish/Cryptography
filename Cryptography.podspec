Pod::Spec.new do |s|
  s.name             = 'Cryptography'
  s.version          = '0.1.2'
  s.summary          = 'A modern cryptography library in Swift.'

  s.description      = <<-DESC
A modern cryptography library in Swift.
Features:
Hash Functions - MD5, SHA-1, SHA-2 (SHA-224, SHA-256, SHA-384, SHA-512, SHA-512/224, SHA-512/256), SHA-3.
Message Authentication Codes - HMAC
                       DESC

  s.homepage         = 'https://github.com/mlachmish/Cryptography'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matan Lachmish' => 'mlachmish@gmail.com' }
  s.source           = { :git => 'https://github.com/mlachmish/Cryptography.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mlachmish'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Cryptography/**/*'
  s.requires_arc = true

end
