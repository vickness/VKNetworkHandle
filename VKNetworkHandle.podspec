Pod::Spec.new do |s|
    s.name         = 'VKNetworkHandle'
    s.version      = '1.0'
    s.summary      = 'A network tool with AFNetworking'
    s.homepage     = 'https://github.com/Senvid-iOS/VKNetworkHandle'
    s.license      = 'MIT'
    s.authors      = {'Senvid' => 'hbcsw123@163.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/Senvid-iOS/VKNetworkHandle.git', :tag => s.version}
    s.source_files = 'VKNetworkHandle/**/*.{h,m}'
    s.requires_arc = true
    s.dependency 'AFNetworking'
end
