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
  s.source       = { :git => "https://github.com/rajivshah3/KDBXKit.git", :tag => "v#{s.version}" }
  s.requires_arc = true
  s.default_subspec = "Core"

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/Core/**/*.{h,m,swift}"
    ss.dependency 'KDBXKit/Argon2'
  end

  s.subspec "Argon2" do |ss|
    ss.source_files = "Sources/Argon2/**/*.{h,m,swift}"
    ss.dependency 'CatCrypto'
  end


end
