Pod::Spec.new do |spec|
  spec.name = 'Mockingjay'
  spec.version = '0.1.0'
  spec.summary = 'An elegant library for stubbing HTTP requests with ease in Swift.'
  spec.homepage = 'https://github.com/kylef/Mockingjay'
  spec.license = { :type => 'BSD', :file => 'LICENSE' }
  spec.author = { 'Kyle Fuller' => 'kyle@fuller.li' }
  spec.social_media_url = 'http://twitter.com/kylefuller'
  spec.source = { :git => 'https://github.com/kylef/Mockingjay.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.requires_arc = true

  spec.subspec 'Core' do |core_spec|
    core_spec.dependency 'URITemplate', '~> 1.1'
    core_spec.source_files = 'Mockingjay/Mockingjay.{h,swift}',
        'Mockingjay/MockingjayProtocol.swift',
        'Mockingjay/{Matchers,Builders}.swift'
  end

  spec.subspec 'Session' do |session_spec|
    session_spec.dependency 'Mockingjay/Core'
    session_spec.source_files = 'Mockingjay/NSURLSessionConfiguration.swift'
  end

  spec.subspec 'XCTest' do |xctest_spec|
    xctest_spec.dependency 'Mockingjay/Core'
    xctest_spec.source_files = 'Mockingjay/XCTest.swift'
    xctest_spec.frameworks = 'XCTest'
  end

  spec.subspec 'Blueprint' do |blueprint_spec|
    blueprint_spec.dependency 'Representor', '~> 0.3.0'
    blueprint_spec.source_files = 'Mockingjay/Blueprint.swift'
  end
end

