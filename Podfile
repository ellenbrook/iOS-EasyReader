platform :ios, '7.0'

link_with ['Development', 'Staging', 'Production', 'EasyReader - Unit Tests']

# Hide cocoapods project warnings
inhibit_all_warnings!


# Cocopods public repo

pod 'SDWebImage', '~> 3.5.1'
pod 'MBProgressHUD', '~> 0.8'

pod 'MFSideMenu', '~> 0.5.4'
pod 'TestFlightSDK', '~> 2.2.0-noadid-beta'
pod 'MagicalRecord', :git => 'https://github.com/magicalpanda/MagicalRecord', :commit => '98ec121bf767c495a2e887adeade7383b74a62f4'

pod 'MTLabel', '~> 0.0.1'

pod 'AFNetworking', '~> 2.0.3'

pod 'NSDate+TimeAgo', '~> 1.0.2'

pod 'Inflections', '~> 1.0.0'

pod 'Block-KVO', '~> 2.2.1'

pod 'MAObjCRuntime', '~> 0.0'

# Private CS repos
pod 'CSEnhancedTableView', '~> 0.0.1'
pod 'CSStandardViewControllers', '~> 0.0.1'
pod 'CSShortcuts', '~> 0.0.1'

# Testing
pod 'OCMock', '~> 2.2.2'
target 'EasyReader - Integration Tests', :exclusive => true do
    pod 'KIF', '~> 2.0'
end
