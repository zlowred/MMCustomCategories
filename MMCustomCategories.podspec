Pod::Spec.new do |s|
  s.name     = 'MMCustomCategories'
  s.version  = '0.1'
  s.platform = :ios, '5.0'
  s.license  = 'MIT'
  s.summary  = 'Max\'s custom categories.'
  s.homepage = 'http://maxmatveev.com'
  s.author   = { 'Max Matveev' => 'mail@maxmatveev.com' }
  s.source   = { :git => 'https://github.com/zlowred/MMCustomCategories.git' }

  s.description = 'None yet'

  s.source_files = 'MMCustomCategories/*.{h,m}'
  s.requires_arc = true
end
