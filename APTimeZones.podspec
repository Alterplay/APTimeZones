Pod::Spec.new do |s|
  s.name         = 'APTimeZones'
  s.version      = '1.0.1'
  s.platform     = :ios, '6.0'
  s.summary      = 'Great drop-in offline tool to get NSTimeZone from CLLocation. Requires ARC.'
  s.author = {
    'Serg Krivoblotsky' => 'sergey@alterplay.com'
  }
  s.source = {
    :git => 'git@github.com:Alterplay/APTimeZones.git'
  }
  s.source_files = 'APTimeZones/*.{h,m}'
  s.requires_arc = true
  s.frameworks   = 'CoreLocation'
  s.resources = 'APTimeZones/timezonesDB.json'
end