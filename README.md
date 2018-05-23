# SwiftyRichText

一个适用于 Swift 的富文本 (`NSAttributedString`) 处理库。

目前支持定义的属性列表：

- UIFont
- 前景颜色
- 背景颜色
- 下划线
- 删除线
- HTML加载
- 段落样式 (`NSMutableParagraphStyle`)

......待继续添加。

![](https://github.com/HjzCy/SwiftyRichText/blob/master/Screenshots/screen_shot.png)

## 安装

```ruby
pod 'SwiftyRichText'
```

## 使用

如需多行显示，先设置 `label` 的 `numberOfLines` 属性。

```swift
// 基本使用
let attrText = "决斗当日".addAttributes([.font(.systemFont(ofSize: 28)), .color(.blue)])
.add("谢尔兹和林肯按照约定来到密西西比河畔，".addAttribute(.font(.systemFont(ofSize: 17))))
.add("在岸上对峙。".addAttribute(.backColor(.red)))
label.attributedText = attrText

// 设置段落样式
let attrStr = "0.00\n账号余额".addAttribute(Attribute.paragraph({ (style) in
    style.lineSpacing = 8
    style.alignment = .center
}))
label.attributedText = attrStr
```

### 加载HTML

```swift
let str = """
          <p>请在输入框内贴入你需要转换的HTML代码</p>
          <p>HTML转换工具，可以将HTML代码转换为JavaScript字符串</p>
          <p>直接将你所要用程序输出的大串HTML代码贴到输入框中，即可一键生成</p>
          <p>如果您觉得好用，别忘了推荐给朋友！</p>
         """
// toHTML 返回的是可变的属性字符串，可继续自定义操作，
// 例如添加 replace(at:with:) 替换属性: 把字号改成14。
label.attributedText = str.toHTML?.replace(at: 0, with: .font(.systemFont(ofSize: 14)))
```

### 下标

```swift
let attrStr = "属性字符串".addAttribute()
              .add("下标演示".addAttribute(.color(.red)))
attrStr[0]  // "属性字符串" 所在范围的 NSAttributedString
```

## APIs

### String

```swift
public extension String {    
    /// 添加多个属性
    func addAttributes(_ attrs: [Attribute]) -> NSMutableAttributedString
    /// 添加单个属性
    func addAttribute(_ attr: Attribute? = nil) -> NSMutableAttributedString
    /// 转换成HTML格式的属性字符串
	var toHTML: NSMutableAttributedString?
}
```

### NSMutableAttributedString

```swift
extension NSMutableAttributedString {
    
    /// 添加属性字符串
    /// 如果传入的属性字符串没有 .font 属性，则同步上一个的 font
    public func add(_ attString: NSAttributedString) -> NSMutableAttributedString
    
    /// 替换指定索引的属性字符串
    @discardableResult
    public func replace(at index: Int, with attrString: NSAttributedString) -> NSMutableAttributedString
    
    /// 替换指定索引的字符串
    @discardableResult
    public func replace(at index: Int, with str: String) -> NSMutableAttributedString
    
    /// 替换指定索引的多个属性
    /// isRetain: 是否保留其余属性不变
    @discardableResult
    public func replace(at index: Int, with attrs: [Attribute], isRetain: Bool = true) -> NSMutableAttributedString
    
    /// 替换指定索引的单个属性
    /// isRetain: 是否保留其余属性不变
    @discardableResult
    public func replace(at index: Int, with attr: Attribute, isRetain: Bool = true) -> NSMutableAttributedString
}
```

### NSAttributedString

```swift
extension NSAttributedString {
    
    /// 获取指定索引的属性字符串范围
    func range(at index: Int) -> NSRange
    
    /// 遍历
    public func forEach(body: (Int, [NSAttributedStringKey: Any], NSRange, UnsafeMutablePointer<ObjCBool>) -> Void)
    
    /// 筛选一个条件，返回这个条件的 bool。
    public func filter(isIncluded: ((index: Int, attrs: [NSAttributedStringKey: Any], range: NSRange)) -> Bool) -> Bool
    
    /// 返回指定下标的属性字符串
    public subscript(index: Int) -> NSAttributedString
}
```

## 最后

如果您在使用中有任何问题或宝贵的建议恳请及时提出，感谢使用！
