//
//  NSAttributedString+Hjz.swift
//  test
//
//  Created by 黄江桂 on 2018/5/23.
//  Copyright © 2018年 黄江桂. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    /// 获取指定索引的属性字符串范围
    func range(at index: Int) -> NSRange {
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
    
    /// 筛选一个条件，返回这个条件的 bool。
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




















