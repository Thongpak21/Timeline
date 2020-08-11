
platform :ios, '13.0'
inhibit_all_warnings!


target 'Timeline' do
  use_frameworks!
  pod 'RxSwift'
  pod 'RxCocoa'
  
  target 'TimelineTests' do
    inherit! :search_paths
    pod 'RxSwift'
    pod 'RxCocoa'
  end
end

target 'Domain' do
  use_frameworks!
  pod 'RxSwift'
  target 'DomainTests' do
    inherit! :search_paths
  
  end

end

target 'NetworkPlatform' do

    use_frameworks!
    pod 'RxAlamofire'

    target 'NetworkPlatformTests' do
        inherit! :search_paths
  
    end
    
end

