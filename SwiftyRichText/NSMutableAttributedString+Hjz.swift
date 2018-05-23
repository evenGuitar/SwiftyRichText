//
//  NSMutableAttributedString+Hjz.swift
//  Mnl
//
//  Created by 黄江桂 on 2018/5/21.
//  Copyright © 2018年 海南美哪里信息技术有限公司. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    
    /// 添加属性字符串
    /// 如果传入的属性字符串没有 .font 属性，则同步上一个的 font
    @discardableResult
    public func add(_ attString: NSAttributedString) -> NSMutableAttributedString {
        // 传入的属性字符串没有设置 .font 属性
        if !NSMutableAttributedString(attributedString: attString).filter { $0.attrs.contains { $0.key == .font } } {
            var attrs = attString.attributes(at: 0, effectiveRange: nil)
            attrs[.font] = attributes(at: length - 1, effectiveRange: nil)[.font]
            append(NSAttributedString(string: attString.string, attributes: attrs))
            return self
        }
        append(attString)
        return self
    }
    
    /// 替换指定索引的属性字符串
    @discardableResult
    public func replace(at index: Int, with attrString: NSAttributedString) -> NSMutableAttributedString {
        replaceCharacters(in: range(at: index), with: attrString)
        return self
    }
    
    /// 替换指定索引的字符串
    @discardableResult
    public func replace(at index: Int, with str: String) -> NSMutableAttributedString {
        replaceCharacters(in: range(at: index), with: str)
        return self
    }
    
    /// 替换指定索引的多个属性
    /// isRetain: 是否好留其余属性不变
    @discardableResult
    public func replace(at index: Int, with attrs: [Attribute], isRetain: Bool = true) -> NSMutableAttributedString {
        let keyValue = isRetain ? self[index].attributes(at: 0, effectiveRange: nil) : [:]
        let attributes = attrs.reduce(into: keyValue) { (result, att) in
            result.merge(att.keyValue, uniquingKeysWith: { $1 })
        }
        let attrString = NSAttributedString(string: self[index].string, attributes: attributes)
        return replace(at: index, with: attrString)
    }
    
    /// 替换指定索引的单个属性
    /// isRetain: 是否好留其余属性不变
    @discardableResult
    public func replace(at index: Int, with attr: Attribute, isRetain: Bool = true) -> NSMutableAttributedString {
        return replace(at: index, with: [attr], isRetain: isRetain)
    }
}














