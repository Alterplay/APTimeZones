Pod::Spec.new do |s|
  s.name         = 'TimeZonesDB'
  s.version      = '1.0.0'
  s.platform     = :ios, '6.0'
  s.summary      = 'TimeZonesDB library'
  s.author = {
    'Serg Krivoblotsky' => 'sergey@alterplay.com'
  }
  s.source = {
    :git => 'git@github.com:Alterplay/TimeZonesDB.git'
  }
  s.source_files = 'TimeZonesDB/*.{h,m,json}'
  s.requires_arc = true
end