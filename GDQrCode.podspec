Pod::Spec.new do |s|
s.name         = 'GDQrCode'
s.version      = '0.0.4'
s.summary      = '基于 CoreImage 生成一个自定义二维码(颜色 背景色 alpha logo)'
s.homepage     = 'https://github.com/gdLin600/GDQrCode'
s.license      = 'MIT'
s.authors      = { 'gdLin600' => 'lingd600@163.com' }
s.platform     = :ios, '7.0'
s.source       = { :git => 'https://github.com/gdLin600/GDQrCode.git', :tag => s.version.to_s }
s.source_files = 'GDQrCode/*.{h,m}'
#s.resource     = 'GDQrCode/GDQrCode.bundle'
s.framework    = 'UIKit','AVFoundation'
#s.dependency 'Masonry'
s.requires_arc = true
end