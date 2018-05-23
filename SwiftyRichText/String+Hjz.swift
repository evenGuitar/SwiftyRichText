//
//  String.swift
//  Mnl
//
//  Created by 黄江桂 on 2018/5/20.
//  Copyright © 2018年 海南美哪里信息技术有限公司. All rights reserved.
//

import UIKit

public extension String {
    
    /// 添加多个属性
    func addAttributes(_ attrs: [Attribute]) -> NSMutableAttributedString {
        let attributes = attrs.reduce(into: [NSAttributedStringKey: Any]()) { (result, att) in
            result.merge(att.keyValue, uniquingKeysWith: { $1 })
        }
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
    
    /// 添加单个属性
    func addAttribute(_ attr: Attribute? = nil) -> NSMutableAttributedString {
        guard let attr = attr else {
            return NSMutableAttributedString(string: self)
        }
        return addAttributes([attr])
    }
    
    /// 转换成HTML格式的属性字符串
    var toHTML: NSMutableAttributedString? {
        do {
            return try NSMutableAttributedString(data: data(using: .unicode)!, options: [.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
        }catch {
            debugPrint(error)
            return nil
        }
    }
}






















