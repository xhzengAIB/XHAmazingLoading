Pod::Spec.new do |s|
  s.name         = "XHAmazingLoading"
  s.version      = "0.1"
  s.summary      = "XHAmazingLoading indicators or load view based on CAReplicatorLayer class and functional programming technology"
  s.homepage     = "https://github.com/xhzengAIB/XHAmazingLoading"
  s.license      = "MIT"
  s.authors      = { "Jack" => "xhzengAIB@gmail.com" }
  s.source       = { :git => "https://github.com/xhzengAIB/XHAmazingLoading.git", :tag => "0.1" }
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'
  s.platform     = :ios, '6.0'
  s.source_files = 'XHAmazingLoading/*/*.{h,m}'
  s.requires_arc = true
end
