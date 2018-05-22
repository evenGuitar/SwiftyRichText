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
    public func add(_ attString: NSMutableAttributedString) -> NSMutableAttributedString {
        // 传入的属性字符串没有设置 .font 属性
        if !attString.filter { $0.attrs.contains { $0.key == .font } } {
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


extension NSMutableAttributedString {
    
    /// 获取指定索引的属性字符串范围
    private func range(at index: Int) -> NSRange {
        var findRange: NSRange?
        forEach { (offset, attrs, range, stop) in
            if offset == index {
                findRange = range
            }
        }
        return findRange!
    }
    
    /// 遍历
    public func forEach(body: (Int, [NSAttributedStringKey: Any], NSRange, UnsafeMutablePointer<ObjCBool>) -> Void) {
        var offset = 0
        enumerateAttributes(in: NSRange(location: 0, length: length), options: .longestEffectiveRangeNotRequired) { (attrs, range, stop) in
            body(offset, attrs, range, stop)
            offset += 1
        }
    }
    
    /// 筛选一个条件，返回这个条件的 bool 值
    public func filter(isIncluded: ((index: Int, attrs: [NSAttributedStringKey: Any], range: NSRange)) -> Bool) -> Bool {
        var bool = false
        forEach { (index, attrs, range, stop) in
            if isIncluded((index, attrs, range)) {
                bool = true
                stop.initialize(to: true)   // 停止继续遍历
            }
        }
        return bool
    }
    
    /// 返回指定下标的属性字符串
    public subscript(index: Int) -> NSAttributedString {
        return attributedSubstring(from: range(at: index))
    }
}














