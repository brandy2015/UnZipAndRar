#
#  Be sure to run `pod spec lint XYZColor.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|



  s.name         = "UnZipAndRar"
  s.version      = "0.3.0"
  s.summary      = "解压缩的库xxxxxxxxxxxxxxxxx"
  s.description  = <<-DESC
                    解压缩支持.zip .rar格式xxxxxxxxxxxxxxxxxxxxxxxxxxx

                   DESC

  s.homepage     = "https://github.com/brandy2015/UnZipAndRar"

  s.license      = "MIT"

  s.swift_version = '4.2'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }


  s.dependency 'Zip'
  s.dependency 'FileKit'
  s.dependency 'UnrarKit'
  s.dependency 'SHTManager'
  s.dependency 'SHPathManager'


  s.ios.deployment_target = '10.1'
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Brandy" => "" }


  s.authors            = { "Brandy" => "zhangqianbrandy2012@gmail.com" }
  s.platform     = :ios, "10.1"
  s.source       = { :git => "https://github.com/brandy2015/UnZipAndRar.git", :tag => "0.3.0"}
  s.source_files = "UnZipAndRar/Source/*"


  # s.social_media_url   = "http://twitter.com/Brandy"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios





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



#{ :git => "http://EXAMPLE/XYZColor.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

#s.source_files  = "XYZColor"#, "XYZColor/**/*.{h,m}"
#  s.exclude_files = "Classes/Exclude"

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
