
Pod::Spec.new do |s|
  s.name         = "RNAppleReplaykit"
  s.version      = "1.0.0"
  s.summary      = "RNAppleReplaykit"
  s.description  = <<-DESC
                  RNAppleReplaykit
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "SCDev1025" => "scdev1025@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNAppleReplaykit.git", :tag => "master" }
  s.source_files  = "RNAppleReplaykit/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  