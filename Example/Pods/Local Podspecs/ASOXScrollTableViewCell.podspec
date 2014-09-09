Pod::Spec.new do |s|
  s.name             = "ASOXScrollTableViewCell"
  s.version          = "0.1.0"
  s.summary          = 'An easy-to-configure Horizontal Scroll Table View through interface builder'
  s.description      = 'An easy-to-configure Horizontal Scroll Table View through interface builder. This library suits well for an implementation which integrate Search Display Controller and Horizontal Scroll Table View on the same UITableViewController.'
  s.homepage         = "https://github.com/agusso/ASOXScrollTableViewCell"
  s.license          = 'MIT'
  s.author           = { 'Agus Soedibjo' => 'contact@soedibjo.com' }
  s.source           = { :git => 'https://github.com/agusso/ASOXScrollTableViewCell.git', :tag => '0.1.0' }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  
  s.source_files = 'Pod/Classes/*'

end
