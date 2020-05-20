

Pod::Spec.new do |s|



  s.name         = "UnZipAndRar"
  s.version      = "1.1.3"
  s.summary      = "解压缩的库xxxxxxxxxxxxxxxxx"
  s.description  = <<-DESC
                    解压缩支持.zip .rar格式xxxxxxxxxxxxxxxxxxxxxxxxxxx

                   DESC

  s.homepage     = "https://github.com/brandy2015/UnZipAndRar"

  s.license      = "MIT"

  s.swift_version = '5.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }


  s.dependency 'Zip'
  #s.dependency 'FileKit'
  s.dependency 'UnrarKit'
  #s.dependency 'SHTManager'
  #s.dependency 'SHPathManager'


  s.ios.deployment_target = '13.0'
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Brandy" => "" }


  s.authors            = { "Brandy" => "zhangqianbrandy2012@gmail.com" }
  s.platform     = :ios, "13.0"
  s.source       = { :git => "https://github.com/brandy2015/UnZipAndRar.git", :tag => "1.1.3"}
  s.source_files = "UnZipAndRar/Source/*"


end
