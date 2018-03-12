source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
use_frameworks!

target 'ZhiLieHui' do
 pod 'SDWebImage'
 pod 'MJRefresh'
 pod 'SnapKit'
 pod 'Alamofire'
end
post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['ENABLE_BITCODE'] = 'NO'
           end
       end
   end