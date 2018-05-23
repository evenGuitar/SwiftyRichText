Pod::Spec.new do |s|
    s.name          = "SwiftyRichText"	# 仓库名
    s.version       = "0.0.3" # 版本号
    s.summary       = "一个适用于 Swift 的富文本 (NSAttributedString) 处理库。" # 概要
    s.homepage      = "https://github.com/HjzCy/SwiftyRichText" # 仓库主页
    s.license       = { :type => "MIT", :file => "LICENSE" }	# 许可证
    s.author        = { "HjzCy" => "780810441@qq.com" }	# 作者
    s.platform      = :ios, "9.0"	# 支持的软件平台
    s.swift_version = "4.0"
    # 仓库源
    s.source        = { :git => "https://github.com/HjzCy/SwiftyRichText.git", :tag => "v#{s.version}" }
    # 源文件所在路径，跟 .podspec 平级.
    s.source_files  = "SwiftyRichText/**/*"
  end
