Pod::Spec.new do |s|
    s.name             = 'InfiniteScroller'
    s.version          = '0.3.1'
    s.summary          = 'Simply implement infinite scroll'
    s.description      = <<-DESC
    Simplifies custom implementation of infinite scroll
    DESC
    s.homepage         = 'https://github.com/olejnjak/InfiniteScroller'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Jakub Olejník' => 'olejnjak@gmail.com' }
    s.social_media_url = "https://twitter.com/olejnjak"
    s.source           = { :git => 'https://github.com/olejnjak/InfiniteScroller.git', :tag => s.version.to_s }
    s.ios.deployment_target = '11.0'
    s.source_files     = 'Sources/InfiniteScroller/*.swift'
    s.swift_version    = '5.0'
end
