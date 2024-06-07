

Pod::Spec.new do |s|
    s.name         = "Ottu"
    s.version      = "1.0.86"
    s.summary      = "The Ottu iOS SDK makes it quick and easy to build an excellent payment experience in your iOS app."
    s.description  = <<-DESC
**Simplified security**: We make it simple for you to collect sensitive data such as credit card numbers and remain PCI compliant.
**Apple Pay**: We provide a [seamless integration with Apple Pay]().
    DESC
    s.homepage     = "https://github.com/ottuco/ottu-ios-sdk.git"
    s.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2022
                   Permission is granted to Ottu
                  LICENSE
                }
    s.author             = { "Maninder" => "er.maninderbindra@gmail.com" }
    s.source       = { :git => "https://github.com/ottuco/ottu-ios-sdk.git", :tag => "#{s.version}" }
    s.vendored_frameworks = "Source/Ottu.xcframework"
    s.dependency 'ApplePayButton', '1.0.3'
    s.platform = :ios
    s.swift_version = "5.0"

    s.ios.deployment_target  = '12.0'
    s.static_framework = true
    s.user_target_xcconfig = {
      'SWIFT_INCLUDE_PATHS' => '"\$(PODS_ROOT)/Ottu/Ottu.xcframework"'
    }
end
