Pod::Spec.new do |s|
  s.name         = 'UIDevice-Hardware'
  s.version      = '0.2.0'
  s.license      = { :type => 'BSD', :file => 'LICENSE' }
  s.platform     = :ios
  s.summary      = 'Category on UIDevice to distinguish between platforms and provide human-readable device names e.g. "iPhone 16 Pro".'
  s.homepage     = 'https://github.com/shebuka/UIDevice-Hardware'
  s.authors      = { 'Erica Sadun' => 'erica@ericasadun.com', 'Eric Horacek' => 'eric@monospacecollective.com', 'Serge Golubenko' => 'sanctor.green@gmail.com' }
  s.source       = { :git => 'https://github.com/shebuka/UIDevice-Hardware.git', :tag => s.version.to_s }
  s.source_files = 'UIDevice+Hardware.{h,m}'
  s.requires_arc = true
end
