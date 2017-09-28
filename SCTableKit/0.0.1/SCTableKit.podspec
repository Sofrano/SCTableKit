Pod::Spec.new do |s|
s.name                  = 'SCTableKit'
s.module_name           = 'SCTableKit'

s.version               = '0.0.1'

s.homepage              = 'https://github.com/sofrano/SCTableKit'
s.summary               = 'Type-safe declarative table views with Swift.'

s.author                = { 'Dmitriy Safarov' => 'kazdevelop@gmail.com' }
s.license               = { :type => 'MIT', :file => 'LICENSE' }
s.platforms             = { :ios => '9.1' }
s.ios.deployment_target = '9.1'

s.source_files          = 'SCTableKit/Classes/*.swift'
s.source                = { :git => 'https://github.com/sofrano/SCTableKit.git', :tag => s.version }
end
