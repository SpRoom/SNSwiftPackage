#
#  Be sure to run `pod spec lint SNSwiftPackageDemo1.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "SNSwiftPackage"
  s.version      = "0.1.2"
  s.summary      = "SNSwiftPackage."
  s.swift_version = '4.0'

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
          这只是一个建立pod仓库的简单demo，并没有实际的意思。教学使用。
          当然这里只是尝试搭建一个自己的pod
                   DESC

  s.homepage     = "https://github.com/SpectatorNanWithZZC/SNSwiftPackage"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  #s.license      = "MIT (example)"
   s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "spectatorNan" => "spectatornan@gmail.com" }
  # Or just: s.author    = "spectatorNan"
  # s.authors            = { "spectatorNan" => "spectatornan@gmail.com" }
  # s.social_media_url   = "http://twitter.com/spectatorNan"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform     = :ios
  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/SpectatorNanWithZZC/SNSwiftPackage.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # s.source_files  = "Classes", "Classes/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"


  s.requires_arc          = true
  s.default_subspec = "Core"


  s.subspec "Core" do |ss|
    ss.source_files  = "Dependences/Classes/SNExtension/**/*"
    ss.framework  = "Foundation", "UIKit"

  end

  s.subspec "Base" do |ss|
  ss.source_files = "Dependences/Classes/Base/**/*"
  ss.dependency "SNSwiftPackage/Core"
  ss.dependency "SNSwiftPackage/RxSwiftExtension"
  ss.dependency "SNSwiftPackage/Snap"
  end

  s.subspec "RxSwiftExtension" do |ss|
    ss.source_files = "Dependences/Classes/Rx/**/*"
    ss.dependency "RxSwift", "~> 4.0"
    ss.dependency 'RxCocoa', '~> 4.0.0'
  end

  s.subspec "Snap" do |ss|
    ss.source_files = "Dependences/Classes/SnapKit/**/*"
    ss.dependency "SnapKit", "~> 4.0.0"
    ss.dependency "SNSwiftPackage/Core"
  end

  s.subspec "HUD" do |ss|
    ss.source_files = "Dependences/Classes/SVProgressHUD/**/*"
    ss.dependency "SVProgressHUD", " 2.2.2"
    ss.dependency "SNSwiftPackage/Core"
  end

  s.subspec "API" do |ss|
    ss.source_files = "Dependences/Classes/ApiManager/**/*"
    ss.dependency "Moya/RxSwift", "~> 11"
    ss.dependency 'SwiftyJSON', '~> 4.0'
    ss.dependency "SNSwiftPackage/RxSwiftExtension"
    ss.dependency "SNSwiftPackage/Core"
  end

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
