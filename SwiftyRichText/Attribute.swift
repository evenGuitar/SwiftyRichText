//
//  Attribute.swift
//  Mnl
//
//  Created by 黄江桂 on 2018/5/22.
//  Copyright © 2018年 海南美哪里信息技术有限公司. All rights reserved.
//

import UIKit

public enum Attribute {
    
    /// 前景颜色
    case color(UIColor)
    /// 背景颜色
    case backColor(UIColor)
    /// 字体
    case font(UIFont)
    /// 段落
    case paragraph((NSMutableParagraphStyle) -> Void)
    
    /// 删除线
    case strikethrough(NSUnderlineStyle)
    /// 删除线颜色
    case strikethroughColor(UIColor)
    /// 删除线加颜色
    case strikethroughWithColor(NSUnderlineStyle, UIColor)
    
    /// 下划线
    case underline(NSUnderlineStyle)
    /// 下划线颜色
    case underlineColor(UIColor)
    /// 下划线和颜色
    case underlineWithColor(NSUnderlineStyle, UIColor)
    
    
    var keyValue: [NSAttributedStringKey: Any] {
        switch self {
            
        case .color(let color):
            return [.foregroundColor: color]
        case .backColor(let color):
            return [.backgroundColor: color]
        case .font(let font):
            return [.font: font]
        case .paragraph(let style):
            let pStyle = NSMutableParagraphStyle()
            style(pStyle)
            return [.paragraphStyle: pStyle]
            
        case .strikethrough(let style):
            return [.strikethroughStyle: style.hashValue]
        case .strikethroughColor(let color):
            return [.strikethroughColor: color]
        case .strikethroughWithColor(let style, let color):
            return [.strikethroughStyle: style.hashValue, .strikethroughColor: color]
            
        case .underline(let style):
            return [.underlineStyle: style.hashValue]
        case .underlineColor(let color):
            return [.underlineColor: color]
        case .underlineWithColor(let style, let color):
            return [.underlineStyle: style.hashValue, .underlineColor: color]
        }
    }
}














