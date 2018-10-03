Pod::Spec.new do |s|
  s.name         = "KDBXKit"
  s.version      = "0.0.1"
  s.summary      = "A framework for importing, exporting, and creating KeePass databases"

  s.description  = <<-DESC
                KDBX, written in Swift, allows you to import, export, create, and edit your KeePass databases (KDBX).
                   DESC

  s.homepage     = "https://github.com/rajivshah3/KDBXKit"
  s.license      = "MIT"
  s.author             = { "Rajiv Shah" => "rajivshah1@icloud.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/rajivshah3/KDBXKit.git", :tag => "v#{s.version}", :submodules => true }
  s.requires_arc = true
  s.default_subspec = "Core"

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/Core/**/*.{h,m,swift}"
    ss.dependency "KDBXKit/Argon2"
    ss.dependency "KissXML", "5.2.3"
  end

  s.subspec "Argon2" do |ss|
    ss.source_files = "Sources/Argon2/**/*.{h,m,swift}"
    ss.subspec "CatCrypto" do |sss|
      sss.source_files = 'Sources/Crypto/Argon2/CatCrypto/Sources/**/*.{h,c,swift}'
      sss.private_header_files = ['Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2/*.h', 'Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6/*.h', 'Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3/*.h']
      sss.preserve_paths = ['Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2', 'Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6', 'Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3', 'Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/CommonCrypto']
      sss.pod_target_xcconfig = {
        'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]'          => '$(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/CommonCrypto/iPhoneOS $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3',
        'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]'   => '$(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/CommonCrypto/iPhoneSimulator $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3',
        'SWIFT_INCLUDE_PATHS[sdk=appletvos*]'         => '$(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/CommonCrypto/AppleTVOS $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3',
        'SWIFT_INCLUDE_PATHS[sdk=appletvsimulator*]'  => '$(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/CommonCrypto/AppleTVSimulator $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3',
        'SWIFT_INCLUDE_PATHS[sdk=macosx*]'            => '$(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/CommonCrypto/MacOSX $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3',
        'SWIFT_INCLUDE_PATHS[sdk=watchos*]'           => '$(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/CommonCrypto/WatchOS $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3',
        'SWIFT_INCLUDE_PATHS[sdk=watchsimulator*]'    => '$(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/CommonCrypto/WatchSimulator $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/Argon2 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/MD6 $(PODS_TARGET_SRCROOT)/Sources/Crypto/Argon2/CatCrypto/Sources/ModuleMaps/SHA3'
      }

    end
  end


end
