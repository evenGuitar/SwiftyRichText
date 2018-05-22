# HjzAttributedString

一个适用于 Swift 的富文本处理库。

目前支持定义的属性列表：

- UIFont
- 前景颜色
- 背景颜色
- 下划线
- 删除线
- HTML加载
- 段落样式 (`NSMutableParagraphStyle`)

......待继续添加。

![](https://github.com/HjzCy/HjzAttributedString/blob/master/Screenshots/screen_shot.png)

## 使用

```swift
let attrText = "决斗当日".addAttributes([.font(.systemFont(ofSize: 28)), .color(.blue)])
.add("谢尔兹和林肯按照约定来到密西西比河畔，".addAttribute(.font(.systemFont(ofSize: 17))))
.add("在按上对峙。".addAttribute(.backColor(.red)))
.add("两人都做好了战斗至死的准备。".addAttribute(.strikethrough(.styleSingle)))
.add("幸运的是，".addAttributes([.color(.white), .font(.systemFont(ofSize: 12)), .backColor(.black)]))
.add("在".addAttribute())
.add("千钧一发".addAttributes([Attribute.underline(.styleSingle), .font(.systemFont(ofSize: 28))]))
.add("之际，".addAttribute(.font(.systemFont(ofSize: 13))))
.add("两个人的支持者及时赶到，".addAttribute())
.add("阻止了悲剧的发生。".addAttributes([.font(.systemFont(ofSize: 17)), .color(.brown), .backColor(.green)]))

attrText.add("\n\n这是林肯一生中最惨痛的教训，".addAttributes([.font(.systemFont(ofSize: 15)), .underlineWithColor(.styleThick, .orange)]))
.add("他也因此学到了为人处世最高贵的一课。从那之后，他再也没写过侮辱人的字眼，也不再出言讥讽。确切的说，在那之后，他几乎从未批评过任何人任何事。".addAttribute(.underlineWithColor(.styleThick, .orange)))

let label = UILabel(frame: CGRect(x: 11, y: 88, width: UIScreen.width - 22, height: 44))
label.numberOfLines = 0
label.attributedText = attrText
label.sizeToFit()
view.addSubview(label)
```

## APIs

### String

```swift
public extension String {    
    /// 添加多个属性
    func addAttributes(_ attrs: [Attribute]) -> NSMutableAttributedString
    /// 添加单个属性
    func addAttribute(_ attr: Attribute? = nil) -> NSMutableAttributedString
}
```

### NSMutableAttributedString

```swift
extension NSMutableAttributedString {
    
    /// 添加属性字符串
    /// 如果传入的属性字符串没有 .font 属性，则同步上一个的 font
    public func add(_ attString: NSMutableAttributedString) -> NSMutableAttributedString
    
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

## 最后

如果您在使用中有任何问题或建议恳请及时提出，感谢使用！
