//
//  XYZPath_XYZString.swift
//  XYZPathKit
//
//  Created by 张子豪 on 2020/4/7.
//  Copyright © 2020 张子豪. All rights reserved.
//

import UIKit

//XYZQRcode需要

//剪贴板快捷方法
public extension String{
    
    func toPasteboard() {
        print("已复制进剪贴板")
        print(self)
        UIPasteboard.general.string = self
    }
    
    mutating func FromPasteboard() {
        print("已从剪贴板复制")
        self = UIPasteboard.general.string ?? "无内容"
        print(self)
    }
    
}


public extension String{
    var withoutExtension: String{
        return String.去文件后缀x(x: self)
    }
    static func 去文件后缀x(x s:String) -> String {
        let backstring = s.compactMap { (sss) -> String.Element? in
            if sss != "."{return sss}else{return nil}
        }
        return String(backstring)
    }
}



public extension String{
    
    func transformToPinYin(取代空格的东西:String = "") -> String{//(String,String){
        let mutableString = NSMutableString(string: self)
        //把汉字转为拼音
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        //去掉拼音的音标
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        //去掉空格
        let 去掉空格 = string.replacingOccurrences(of: " ", with: 取代空格的东西)
        return 去掉空格//(去掉空格//,没有去掉音标 as String)
    }
    
}

//public extension String{
//    var withoutExtension: String{
//        return String.去文件后缀x(x: self)
//    }
//    static func 去文件后缀x(x s:String) -> String {
//
//        let backstring = s.compactMap { (sss) -> String.Element? in
//            if sss != "."{return sss}else{return nil}
//        }
//
//        return String(backstring)
//        //        var 空 = ""
//        //        for i in s { if i != "."{ 空.append(i)}else{ break}}
//        //        return 空
//    }
//}
//print(filepath.withoutExtension)
//public extension String{
//
//    func transformToPinYin(取代空格的东西:String = "") -> String{//(String,String){
//        let mutableString = NSMutableString(string: self)
//        //把汉字转为拼音
//        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
//        //去掉拼音的音标
//        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
//        let string = String(mutableString)
//        //去掉空格
//        let 去掉空格 = string.replacingOccurrences(of: " ", with: 取代空格的东西)
//        return 去掉空格//(去掉空格//,没有去掉音标 as String)
//    }
//
//}
//
//
//var ni = "你好你是谁"
//ni.transformToPinYin()


public extension String{
    func isTelNumber()->Bool
    {
        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: self) == true)
            || (regextestcm.evaluate(with: self)  == true)
            || (regextestct.evaluate(with: self) == true)
            || (regextestcu.evaluate(with: self) == true))
        {
            return true
        }
        else
        {
            return false
        }
    }
}




//extension String {
//
//    //将原始的url编码为合法的url
//    func urlEncoded() -> String {
//        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
//            .urlQueryAllowed)
//        return encodeUrlString ?? ""
//    }
//
//    //将编码后的url转换回原始的url
//    func urlDecoded() -> String {
//        return self.removingPercentEncoding ?? ""
//    }
//}
//let urlStr = "http://hanggge.com?name=航歌&key=!*'();:@&=+$,/?%#[]"
//print("转义后的url：\(urlStr.urlEncoded())")
//print("还原后的url：\(urlStr.urlEncoded().urlDecoded())")

//http://www.hangge.com/blog/cache/detail_1907.html



//Swift - 限制TextField只能输入中文（附：中文字数的限制）
//2017-12-29发布：hangge阅读：3201
//1，效果图
//这里对界面上的 UITextField 做了输入限制，只能输入中文。不接受除中文外的其他一切字符（包括英文、数字、符号等），即使粘贴进来也不行。
//原文:Swift - 限制TextField只能输入中文（附：中文字数的限制）
//
//2，实现原理
//（1）要对 textField 的输入做限制，无非有两种方法。一种是使用 shouldChangeCharactersIn 这个 textField 的代理方法。该方法会在每次 textfield 有输入的时候被调用，我们只需对每次输入的内容进行判断，看是否符合条件即可。
//符合条件的：return true，相应的文字会成功输入到 textField 中。
//不符合条件的：return false，相应的文字无法输入到 textField 中。
//但如果我们只允许输入中文的话就会有问题。因为当我们使用系统的拼音输入法输入中文时，首先需要输入拼音字母，这个叫做 marked text（见下图）。
//原文:Swift - 限制TextField只能输入中文（附：中文字数的限制）
//
//而 marked text 也是会被 shouldChangeCharactersIn 方法强制获取到的。只要打出拼音的第一个英文字母，就会被该方法截取，我们无法判断这个字母是英文字母还是拼音字母。如果禁止英文输入的话，那么中文也就没法打出来了。
//
//（2）所以我们只能使用另一种方法：监听 textField 的 UITextFieldTextDidChangeNotification 通知事件，在事件响应函数里进行如下工作：
//先判断当前是否有 markedtext，有的话我们不做任何动作。
//使用正则过滤掉 textField 里非中文的字符，然后再将结果重新赋给 textField。
//进行上面操作前要记下光标的位置，在赋值后再还原光标位置。否则如果在中间输入文字后，光标会自动跳到末尾。
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    //文本输入框
//    var textField:UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //初始化文本输入框
//        textField = UITextField(frame: CGRect(x:20, y:100, width:200, height:30))
//        textField.borderStyle = .roundedRect
//        self.view.addSubview(textField)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        //监听textField内容改变通知
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(self.greetingTextFieldChanged),
//                                               name:NSNotification.Name(rawValue:"UITextFieldTextDidChangeNotification"),
//                                               object: self.textField)
//    }
//
//    //textField内容改变通知响应
//    @objc func greetingTextFieldChanged(obj: Notification) {
//        //非markedText才继续往下处理
//        guard let _: UITextRange = textField.markedTextRange else{
//            //当前光标的位置（后面会对其做修改）
//            let cursorPostion = textField.offset(from: textField.endOfDocument,
//                                                 to: textField.selectedTextRange!.end)
//            //判断非中文的正则表达式
//            let pattern = "[^\\u4E00-\\u9FA5]"
//            //替换后的字符串（过滤调非中文字符）
//            let str = textField.text!.pregReplace(pattern: pattern, with: "")
//            textField.text = str
//
//            //让光标停留在正确位置
//            let targetPostion = textField.position(from: textField.endOfDocument,
//                                                   offset: cursorPostion)!
//            textField.selectedTextRange = textField.textRange(from: targetPostion,
//                                                              to: targetPostion)
//            return
//        }
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        //移除textField内容改变通知监听
//        NotificationCenter.default.removeObserver(self,
//                                                  name:NSNotification.Name(rawValue: "UITextFieldTextDidChangeNotification"),
//                                                  object: self.textField)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}
//
//extension String {
//    //使用正则表达式替换
//    func pregReplace(pattern: String, with: String,
//                     options: NSRegularExpression.Options = []) -> String {
//        let regex = try! NSRegularExpression(pattern: pattern, options: options)
//        return regex.stringByReplacingMatches(in: self, options: [],
//                                              range: NSMakeRange(0, self.count),
//                                              withTemplate: with)
//    }
//}
//常用的一些正则表达式：
//非中文：[^\\u4E00-\\u9FA5]
//非英文：[^A-Za-z]
//非数字：[^0-9]
//非中文或英文：[^A-Za-z\\u4E00-\\u9FA5]
//非英文或数字：[^A-Za-z0-9]
//非因为或数字或下划线：[^A-Za-z0-9_]
//
//附：增加中文字数限制
//
//下面代码在前面的基础上再增加个字数限制：textField 不仅只能输入中文，而且最多只能输入 10 个字。 （这个同样是监听 textField 的 UITextFieldTextDidChangeNotification 通知事件来实现，高亮部分表示新增加的代码）
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15
//16
//17
//18
//19
//20
//21
//22
//23
//24
//25
////textField内容改变通知响应
//@objc func greetingTextFieldChanged(obj: Notification) {
//    //非markedText才继续往下处理
//    guard let _: UITextRange = textField.markedTextRange else{
//        //当前光标的位置（后面会对其做修改）
//        let cursorPostion = textField.offset(from: textField.endOfDocument,
//                                             to: textField.selectedTextRange!.end)
//        //判断非中文的正则表达式
//        let pattern = "[^\\u4E00-\\u9FA5]"
//        //替换后的字符串（过滤调非中文字符）
//        var str = textField.text!.pregReplace(pattern: pattern, with: "")
//        //如果长度超过限制则直接截断
//        if str.count > 10 {
//            str = String(str.prefix(10))
//        }
//        textField.text = str
//
//        //让光标停留在正确位置
//        let targetPostion = textField.position(from: textField.endOfDocument,
//                                               offset: cursorPostion)!
//        textField.selectedTextRange = textField.textRange(from: targetPostion,
//                                                          to: targetPostion)
//        return
//    }
//}
//
//原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_1907.html



import UIKit
//Swift - String与NSString的区别，以及各自的使用场景
public extension String{
    
    //    func containsString(Contain:String) -> Bool {return NSString(string: self).contains(Contain)}
    
    private func StringRange(words:String,start:Int,lens:Int) -> String? {
        if 0 < words.count && lens <= words.count && lens <= words.count && start < words.count && (start + lens) <= words.count {
            return (words as NSString).substring(with: NSMakeRange(start,lens))
        }
        return nil
    }
    
    func SubString(start:Int,lens:Int) -> String? {
        return StringRange(words: self, start: start, lens: lens)
    }
    
    
    //2，要使用NSString的情况
    ///2）String与Range配合比较麻烦，比如下面截取字符串的一部分，
    ////先转换成NSString
    //let rangeStr1 = (words as NSString).substringWithRange(NSMakeRange(4,2)) //ge
    
    ////不转换
    //let index =  words.index(words.startIndex, offsetBy: 6)
    //let index2 =  words.index(words.startIndex, offsetBy: 8)
    ////let index2 = words.startIndex.advancedBy(6)
    //let range:Range<String.Index> = Range<String.Index>(uncheckedBounds: (index,index2))
    //
    //let rangeStr2 = words.substring(with: range)
    subscript(i: Int) -> Character? {
        get {return self.SubString(start: i, lens: 1)?.first}
    }
    //    f f是起点，t是长度
    subscript(start:Int,lens:Int) -> String? {
        get {return self.SubString(start: start, lens: lens)}
    }
    
    //    r是一个区间
    //    "hello world"[0...1] // "he"
    //    "hello world"[0..<1] // "h"
    //    "hello world"[0] // "h"
    //    "hello world"[0...10] // "hello world"
    
    subscript(r: Range<Int>) -> String? {
        get {return self.SubString(start: r.startIndex, lens: r.endIndex - r.startIndex)}
    }
    
    
    subscript(r: (x1:Int,x2:Int)) -> String? {
        get {return self.SubString(start: r.x1, lens: r.x2 - r.x1)}
    }
    
    //    let name = "Marie Curie"
    //    let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
    //    let firstName = name[..<firstSpace]
    //    print(firstName)
    
    //    print(Array(name.utf8[..<firstSpace]))
    //    // Prints "[77, 97, 114, 105, 101]"
    //2，要使用NSString的情况
    ///2）String与Range配合比较麻烦，比如下面截取字符串的一部分，
    ////先转换成NSString
    //let rangeStr1 = (words as NSString).substringWithRange(NSMakeRange(4,2)) //ge
    
    ////不转换
    //let index =  words.index(words.startIndex, offsetBy: 6)
    //let index2 =  words.index(words.startIndex, offsetBy: 8)
    ////let index2 = words.startIndex.advancedBy(6)
    //let range:Range<String.Index> = Range<String.Index>(uncheckedBounds: (index,index2))
    //
    //let rangeStr2 = words.substring(with: range)
    
}



//
//  SwiftString.swift
//  SwiftString

/*
 //MARK: -//SwiftString.swift
 public extension String {
 
 ///  Finds the string between two bookend strings if it can be found.
 ///
 ///  - parameter left:  The left bookend
 ///  - parameter right: The right bookend
 ///
 ///  - returns: The string between the two bookends, or nil if the bookends cannot be found, the bookends are the same or appear contiguously.
 func between(left: String, _ right: String) -> String? {
 guard
 let leftRange = rangeOfString(left), rightRange = rangeOfString(right, options: .BackwardsSearch)
 where left != right && leftRange.endIndex != rightRange.startIndex
 else { return nil }
 
 return self[leftRange.endIndex...rightRange.startIndex.predecessor()]
 
 }
 
 // https://gist.github.com/stevenschobert/540dd33e828461916c11
 func camelize() -> String {
 let source = clean(with: " ", allOf: "-", "_")
 if source.characters.contains(" ") {
 let first = source.substringToIndex(source.startIndex.advancedBy(1))
 let cammel = NSString(format: "%@", (source as NSString).capitalizedString.stringByReplacingOccurrencesOfString(" ", withString: "", options: [], range: nil)) as String
 let rest = String(cammel.characters.dropFirst())
 return "\(first)\(rest)"
 } else {
 let first = (source as NSString).lowercaseString.substringToIndex(source.startIndex.advancedBy(1))
 let rest = String(source.characters.dropFirst())
 return "\(first)\(rest)"
 }
 }
 
 func capitalize() -> String {
 return capitalizedString
 }
 
 func contains(substring: String) -> Bool {
 return rangeOfString(substring) != nil
 }
 
 func chompLeft(prefix: String) -> String {
 if let prefixRange = rangeOfString(prefix) {
 if prefixRange.endIndex >= endIndex {
 return self[startIndex..<prefixRange.startIndex]
 } else {
 return self[prefixRange.endIndex..<endIndex]
 }
 }
 return self
 }
 
 func chompRight(suffix: String) -> String {
 if let suffixRange = rangeOfString(suffix, options: .BackwardsSearch) {
 if suffixRange.endIndex >= endIndex {
 return self[startIndex..<suffixRange.startIndex]
 } else {
 return self[suffixRange.endIndex..<endIndex]
 }
 }
 return self
 }
 
 func collapseWhitespace() -> String {
 let components = componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).filter { !$0.isEmpty }
 return components.joinWithSeparator(" ")
 }
 
 func clean(with with: String, allOf: String...) -> String {
 var string = self
 for target in allOf {
 string = string.stringByReplacingOccurrencesOfString(target, withString: with)
 }
 return string
 }
 
 func count(substring: String) -> Int {
 return componentsSeparatedByString(substring).count-1
 }
 
 func endsWith(suffix: String) -> Bool {
 return hasSuffix(suffix)
 }
 
 func ensureLeft(prefix: String) -> String {
 if startsWith(prefix) {
 return self
 } else {
 return "\(prefix)\(self)"
 }
 }
 
 func ensureRight(suffix: String) -> String {
 if endsWith(suffix) {
 return self
 } else {
 return "\(self)\(suffix)"
 }
 }
 
 func indexOf(substring: String) -> Int? {
 if let range = rangeOfString(substring) {
 return startIndex.distanceTo(range.startIndex)
 }
 return nil
 }
 
 func initials() -> String {
 let words = self.componentsSeparatedByString(" ")
 return words.reduce(""){$0 + $1[0...0]}
 }
 
 func initialsFirstAndLast() -> String {
 let words = self.componentsSeparatedByString(" ")
 return words.reduce("") { ($0 == "" ? "" : $0[0...0]) + $1[0...0]}
 }
 
 func isAlpha() -> Bool {
 for chr in characters {
 if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
 return false
 }
 }
 return true
 }
 
 func isAlphaNumeric() -> Bool {
 let alphaNumeric = NSCharacterSet.alphanumericCharacterSet()
 return componentsSeparatedByCharactersInSet(alphaNumeric).joinWithSeparator("").length == 0
 }
 
 func isEmpty() -> Bool {
 return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).length == 0
 }
 
 func isNumeric() -> Bool {
 if let _ = defaultNumberFormatter().numberFromString(self) {
 return true
 }
 return false
 }
 
 func join<S: SequenceType>(elements: S) -> String {
 return elements.map{String($0)}.joinWithSeparator(self)
 }
 
 func latinize() -> String {
 return self.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
 }
 
 func lines() -> [String] {
 return self.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
 }
 
 var length: Int {
 get {
 return self.characters.count
 }
 }
 
 func pad(n: Int, _ string: String = " ") -> String {
 return "".join([string.times(n), self, string.times(n)])
 }
 
 func padLeft(n: Int, _ string: String = " ") -> String {
 return "".join([string.times(n), self])
 }
 
 func padRight(n: Int, _ string: String = " ") -> String {
 return "".join([self, string.times(n)])
 }
 
 func slugify(withSeparator separator: Character = "-") -> String {
 let slugCharacterSet = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\(separator)")
 return latinize()
 .lowercaseString
 .componentsSeparatedByCharactersInSet(slugCharacterSet.invertedSet)
 .filter { $0 != "" }
 .joinWithSeparator(String(separator))
 }
 
 func split(separator: Character) -> [String] {
 return characters.split{$0 == separator}.map(String.init)
 }
 
 func startsWith(prefix: String) -> Bool {
 return hasPrefix(prefix)
 }
 
 func stripPunctuation() -> String {
 return componentsSeparatedByCharactersInSet(.punctuationCharacterSet())
 .joinWithSeparator("")
 .componentsSeparatedByString(" ")
 .filter { $0 != "" }
 .joinWithSeparator(" ")
 }
 
 func times(n: Int) -> String {
 return (0..<n).reduce("") { $0.0 + self }
 }
 
 func toFloat() -> Float? {
 if let number = defaultNumberFormatter().numberFromString(self) {
 return number.floatValue
 }
 return nil
 }
 
 func toInt() -> Int? {
 if let number = defaultNumberFormatter().numberFromString(self) {
 return number.integerValue
 }
 return nil
 }
 
 func toDouble(locale: NSLocale = NSLocale.systemLocale()) -> Double? {
 let nf = localeNumberFormatter(locale)
 
 if let number = nf.numberFromString(self) {
 return number.doubleValue
 }
 return nil
 }
 
 func toBool() -> Bool? {
 let trimmed = self.trimmed().lowercaseString
 if trimmed == "true" || trimmed == "false" {
 return (trimmed as NSString).boolValue
 }
 return nil
 }
 
 func toDate(format: String = "yyyy-MM-dd") -> NSDate? {
 return dateFormatter(format).dateFromString(self)
 }
 
 func toDateTime(format: String = "yyyy-MM-dd HH:mm:ss") -> NSDate? {
 return toDate(format)
 }
 
 func trimmedLeft() -> String {
 if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet) {
 return self[range.startIndex..<endIndex]
 }
 return self
 }
 
 func trimmedRight() -> String {
 if let range = rangeOfCharacterFromSet(NSCharacterSet.whitespaceAndNewlineCharacterSet().invertedSet, options: NSStringCompareOptions.BackwardsSearch) {
 return self[startIndex..<range.endIndex]
 }
 return self
 }
 
 func trimmed() -> String {
 return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
 }
 
 subscript(r: Range<Int>) -> String {
 get {
 let startIndex = self.startIndex.advancedBy(r.startIndex)
 let endIndex = self.startIndex.advancedBy(r.endIndex - r.startIndex)
 return self[startIndex..<endIndex]
 }
 }
 
 func substring(startIndex: Int, length: Int) -> String {
 let start = self.startIndex.advancedBy(startIndex)
 let end = self.startIndex.advancedBy(startIndex + length)
 return self[start..<end]
 }
 
 subscript(i: Int) -> Character {
 get {
 let index = self.startIndex.advancedBy(i)
 return self[index]
 }
 }
 }
 
 private enum ThreadLocalIdentifier {
 case DateFormatter(String)
 
 case DefaultNumberFormatter
 case LocaleNumberFormatter(NSLocale)
 
 var objcDictKey: String {
 switch self {
 case .DateFormatter(let format):
 return "SS\(self)\(format)"
 case .LocaleNumberFormatter(let l):
 return "SS\(self)\(l.localeIdentifier)"
 default:
 return "SS\(self)"
 }
 }
 }
 
 private func threadLocalInstance<T: AnyObject>(identifier: ThreadLocalIdentifier, @autoclosure initialValue: () -> T) -> T {
 let storage = NSThread.currentThread().threadDictionary
 let k = identifier.objcDictKey
 
 let instance: T = storage[k] as? T ?? initialValue()
 if storage[k] == nil {
 storage[k] = instance
 }
 
 return instance
 }
 
 private func dateFormatter(format: String) -> NSDateFormatter {
 return threadLocalInstance(.DateFormatter(format), initialValue: {
 let df = NSDateFormatter()
 df.dateFormat = format
 return df
 }())
 }
 
 private func defaultNumberFormatter() -> NSNumberFormatter {
 return threadLocalInstance(.DefaultNumberFormatter, initialValue: NSNumberFormatter())
 }
 
 private func localeNumberFormatter(locale: NSLocale) -> NSNumberFormatter {
 return threadLocalInstance(.LocaleNumberFormatter(locale), initialValue: {
 let nf = NSNumberFormatter()
 nf.locale = locale
 return nf
 }())
 }
 
 
 
 //MARK: -//String+HTML
 
 /// - Parameters:
 ///   - a: not
 ///   - b: not
 
 
 public extension String {
 
 private struct HTMLEntities {
 static let characterEntities : [String: Character] = [
 
 // XML predefined entities:
 "&quot;"     : "\"",
 "&amp;"      : "&",
 "&apos;"     : "'",
 "&lt;"       : "<",
 "&gt;"       : ">",
 
 // HTML character entity references:
 "&nbsp;"     : "\u{00A0}",
 "&iexcl;"    : "\u{00A1}",
 "&cent;"     : "\u{00A2}",
 "&pound;"    : "\u{00A3}",
 "&curren;"   : "\u{00A4}",
 "&yen;"      : "\u{00A5}",
 "&brvbar;"   : "\u{00A6}",
 "&sect;"     : "\u{00A7}",
 "&uml;"      : "\u{00A8}",
 "&copy;"     : "\u{00A9}",
 "&ordf;"     : "\u{00AA}",
 "&laquo;"    : "\u{00AB}",
 "&not;"      : "\u{00AC}",
 "&shy;"      : "\u{00AD}",
 "&reg;"      : "\u{00AE}",
 "&macr;"     : "\u{00AF}",
 "&deg;"      : "\u{00B0}",
 "&plusmn;"   : "\u{00B1}",
 "&sup2;"     : "\u{00B2}",
 "&sup3;"     : "\u{00B3}",
 "&acute;"    : "\u{00B4}",
 "&micro;"    : "\u{00B5}",
 "&para;"     : "\u{00B6}",
 "&middot;"   : "\u{00B7}",
 "&cedil;"    : "\u{00B8}",
 "&sup1;"     : "\u{00B9}",
 "&ordm;"     : "\u{00BA}",
 "&raquo;"    : "\u{00BB}",
 "&frac14;"   : "\u{00BC}",
 "&frac12;"   : "\u{00BD}",
 "&frac34;"   : "\u{00BE}",
 "&iquest;"   : "\u{00BF}",
 "&Agrave;"   : "\u{00C0}",
 "&Aacute;"   : "\u{00C1}",
 "&Acirc;"    : "\u{00C2}",
 "&Atilde;"   : "\u{00C3}",
 "&Auml;"     : "\u{00C4}",
 "&Aring;"    : "\u{00C5}",
 "&AElig;"    : "\u{00C6}",
 "&Ccedil;"   : "\u{00C7}",
 "&Egrave;"   : "\u{00C8}",
 "&Eacute;"   : "\u{00C9}",
 "&Ecirc;"    : "\u{00CA}",
 "&Euml;"     : "\u{00CB}",
 "&Igrave;"   : "\u{00CC}",
 "&Iacute;"   : "\u{00CD}",
 "&Icirc;"    : "\u{00CE}",
 "&Iuml;"     : "\u{00CF}",
 "&ETH;"      : "\u{00D0}",
 "&Ntilde;"   : "\u{00D1}",
 "&Ograve;"   : "\u{00D2}",
 "&Oacute;"   : "\u{00D3}",
 "&Ocirc;"    : "\u{00D4}",
 "&Otilde;"   : "\u{00D5}",
 "&Ouml;"     : "\u{00D6}",
 "&times;"    : "\u{00D7}",
 "&Oslash;"   : "\u{00D8}",
 "&Ugrave;"   : "\u{00D9}",
 "&Uacute;"   : "\u{00DA}",
 "&Ucirc;"    : "\u{00DB}",
 "&Uuml;"     : "\u{00DC}",
 "&Yacute;"   : "\u{00DD}",
 "&THORN;"    : "\u{00DE}",
 "&szlig;"    : "\u{00DF}",
 "&agrave;"   : "\u{00E0}",
 "&aacute;"   : "\u{00E1}",
 "&acirc;"    : "\u{00E2}",
 "&atilde;"   : "\u{00E3}",
 "&auml;"     : "\u{00E4}",
 "&aring;"    : "\u{00E5}",
 "&aelig;"    : "\u{00E6}",
 "&ccedil;"   : "\u{00E7}",
 "&egrave;"   : "\u{00E8}",
 "&eacute;"   : "\u{00E9}",
 "&ecirc;"    : "\u{00EA}",
 "&euml;"     : "\u{00EB}",
 "&igrave;"   : "\u{00EC}",
 "&iacute;"   : "\u{00ED}",
 "&icirc;"    : "\u{00EE}",
 "&iuml;"     : "\u{00EF}",
 "&eth;"      : "\u{00F0}",
 "&ntilde;"   : "\u{00F1}",
 "&ograve;"   : "\u{00F2}",
 "&oacute;"   : "\u{00F3}",
 "&ocirc;"    : "\u{00F4}",
 "&otilde;"   : "\u{00F5}",
 "&ouml;"     : "\u{00F6}",
 "&divide;"   : "\u{00F7}",
 "&oslash;"   : "\u{00F8}",
 "&ugrave;"   : "\u{00F9}",
 "&uacute;"   : "\u{00FA}",
 "&ucirc;"    : "\u{00FB}",
 "&uuml;"     : "\u{00FC}",
 "&yacute;"   : "\u{00FD}",
 "&thorn;"    : "\u{00FE}",
 "&yuml;"     : "\u{00FF}",
 "&OElig;"    : "\u{0152}",
 "&oelig;"    : "\u{0153}",
 "&Scaron;"   : "\u{0160}",
 "&scaron;"   : "\u{0161}",
 "&Yuml;"     : "\u{0178}",
 "&fnof;"     : "\u{0192}",
 "&circ;"     : "\u{02C6}",
 "&tilde;"    : "\u{02DC}",
 "&Alpha;"    : "\u{0391}",
 "&Beta;"     : "\u{0392}",
 "&Gamma;"    : "\u{0393}",
 "&Delta;"    : "\u{0394}",
 "&Epsilon;"  : "\u{0395}",
 "&Zeta;"     : "\u{0396}",
 "&Eta;"      : "\u{0397}",
 "&Theta;"    : "\u{0398}",
 "&Iota;"     : "\u{0399}",
 "&Kappa;"    : "\u{039A}",
 "&Lambda;"   : "\u{039B}",
 "&Mu;"       : "\u{039C}",
 "&Nu;"       : "\u{039D}",
 "&Xi;"       : "\u{039E}",
 "&Omicron;"  : "\u{039F}",
 "&Pi;"       : "\u{03A0}",
 "&Rho;"      : "\u{03A1}",
 "&Sigma;"    : "\u{03A3}",
 "&Tau;"      : "\u{03A4}",
 "&Upsilon;"  : "\u{03A5}",
 "&Phi;"      : "\u{03A6}",
 "&Chi;"      : "\u{03A7}",
 "&Psi;"      : "\u{03A8}",
 "&Omega;"    : "\u{03A9}",
 "&alpha;"    : "\u{03B1}",
 "&beta;"     : "\u{03B2}",
 "&gamma;"    : "\u{03B3}",
 "&delta;"    : "\u{03B4}",
 "&epsilon;"  : "\u{03B5}",
 "&zeta;"     : "\u{03B6}",
 "&eta;"      : "\u{03B7}",
 "&theta;"    : "\u{03B8}",
 "&iota;"     : "\u{03B9}",
 "&kappa;"    : "\u{03BA}",
 "&lambda;"   : "\u{03BB}",
 "&mu;"       : "\u{03BC}",
 "&nu;"       : "\u{03BD}",
 "&xi;"       : "\u{03BE}",
 "&omicron;"  : "\u{03BF}",
 "&pi;"       : "\u{03C0}",
 "&rho;"      : "\u{03C1}",
 "&sigmaf;"   : "\u{03C2}",
 "&sigma;"    : "\u{03C3}",
 "&tau;"      : "\u{03C4}",
 "&upsilon;"  : "\u{03C5}",
 "&phi;"      : "\u{03C6}",
 "&chi;"      : "\u{03C7}",
 "&psi;"      : "\u{03C8}",
 "&omega;"    : "\u{03C9}",
 "&thetasym;" : "\u{03D1}",
 "&upsih;"    : "\u{03D2}",
 "&piv;"      : "\u{03D6}",
 "&ensp;"     : "\u{2002}",
 "&emsp;"     : "\u{2003}",
 "&thinsp;"   : "\u{2009}",
 "&zwnj;"     : "\u{200C}",
 "&zwj;"      : "\u{200D}",
 "&lrm;"      : "\u{200E}",
 "&rlm;"      : "\u{200F}",
 "&ndash;"    : "\u{2013}",
 "&mdash;"    : "\u{2014}",
 "&lsquo;"    : "\u{2018}",
 "&rsquo;"    : "\u{2019}",
 "&sbquo;"    : "\u{201A}",
 "&ldquo;"    : "\u{201C}",
 "&rdquo;"    : "\u{201D}",
 "&bdquo;"    : "\u{201E}",
 "&dagger;"   : "\u{2020}",
 "&Dagger;"   : "\u{2021}",
 "&bull;"     : "\u{2022}",
 "&hellip;"   : "\u{2026}",
 "&permil;"   : "\u{2030}",
 "&prime;"    : "\u{2032}",
 "&Prime;"    : "\u{2033}",
 "&lsaquo;"   : "\u{2039}",
 "&rsaquo;"   : "\u{203A}",
 "&oline;"    : "\u{203E}",
 "&frasl;"    : "\u{2044}",
 "&euro;"     : "\u{20AC}",
 "&image;"    : "\u{2111}",
 "&weierp;"   : "\u{2118}",
 "&real;"     : "\u{211C}",
 "&trade;"    : "\u{2122}",
 "&alefsym;"  : "\u{2135}",
 "&larr;"     : "\u{2190}",
 "&uarr;"     : "\u{2191}",
 "&rarr;"     : "\u{2192}",
 "&darr;"     : "\u{2193}",
 "&harr;"     : "\u{2194}",
 "&crarr;"    : "\u{21B5}",
 "&lArr;"     : "\u{21D0}",
 "&uArr;"     : "\u{21D1}",
 "&rArr;"     : "\u{21D2}",
 "&dArr;"     : "\u{21D3}",
 "&hArr;"     : "\u{21D4}",
 "&forall;"   : "\u{2200}",
 "&part;"     : "\u{2202}",
 "&exist;"    : "\u{2203}",
 "&empty;"    : "\u{2205}",
 "&nabla;"    : "\u{2207}",
 "&isin;"     : "\u{2208}",
 "&notin;"    : "\u{2209}",
 "&ni;"       : "\u{220B}",
 "&prod;"     : "\u{220F}",
 "&sum;"      : "\u{2211}",
 "&minus;"    : "\u{2212}",
 "&lowast;"   : "\u{2217}",
 "&radic;"    : "\u{221A}",
 "&prop;"     : "\u{221D}",
 "&infin;"    : "\u{221E}",
 "&ang;"      : "\u{2220}",
 "&and;"      : "\u{2227}",
 "&or;"       : "\u{2228}",
 "&cap;"      : "\u{2229}",
 "&cup;"      : "\u{222A}",
 "&int;"      : "\u{222B}",
 "&there4;"   : "\u{2234}",
 "&sim;"      : "\u{223C}",
 "&cong;"     : "\u{2245}",
 "&asymp;"    : "\u{2248}",
 "&ne;"       : "\u{2260}",
 "&equiv;"    : "\u{2261}",
 "&le;"       : "\u{2264}",
 "&ge;"       : "\u{2265}",
 "&sub;"      : "\u{2282}",
 "&sup;"      : "\u{2283}",
 "&nsub;"     : "\u{2284}",
 "&sube;"     : "\u{2286}",
 "&supe;"     : "\u{2287}",
 "&oplus;"    : "\u{2295}",
 "&otimes;"   : "\u{2297}",
 "&perp;"     : "\u{22A5}",
 "&sdot;"     : "\u{22C5}",
 "&lceil;"    : "\u{2308}",
 "&rceil;"    : "\u{2309}",
 "&lfloor;"   : "\u{230A}",
 "&rfloor;"   : "\u{230B}",
 "&lang;"     : "\u{2329}",
 "&rang;"     : "\u{232A}",
 "&loz;"      : "\u{25CA}",
 "&spades;"   : "\u{2660}",
 "&clubs;"    : "\u{2663}",
 "&hearts;"   : "\u{2665}",
 "&diams;"    : "\u{2666}",
 ]
 }
 
 // Convert the number in the string to the corresponding
 // Unicode character, e.g.
 //    decodeNumeric("64", 10)   --> "@"
 //    decodeNumeric("20ac", 16) --> "€"
 private func decodeNumeric(string : String, base : Int32) -> Character? {
 let code = UInt32(strtoul(string, nil, base))
 return Character(UnicodeScalar(code))
 }
 
 // Decode the HTML character entity to the corresponding
 // Unicode character, return `nil` for invalid input.
 //     decode("&#64;")    --> "@"
 //     decode("&#x20ac;") --> "€"
 //     decode("&lt;")     --> "<"
 //     decode("&foo;")    --> nil
 private func decode(entity : String) -> Character? {
 if entity.hasPrefix("&#x") || entity.hasPrefix("&#X"){
 return decodeNumeric(entity.substringFromIndex(entity.startIndex.advancedBy(3)), base: 16)
 } else if entity.hasPrefix("&#") {
 return decodeNumeric(entity.substringFromIndex(entity.startIndex.advancedBy(2)), base: 10)
 } else {
 return HTMLEntities.characterEntities[entity]
 }
 }
 
 
 /// Returns a new string made by replacing in the `String`
 /// all HTML character entity references with the corresponding
 /// character.
 func decodeHTML() -> String {
 var result = ""
 var position = startIndex
 
 // Find the next '&' and copy the characters preceding it to `result`:
 while let ampRange = self.rangeOfString("&", range: position ..< endIndex) {
 result.appendContentsOf(self[position ..< ampRange.startIndex])
 position = ampRange.startIndex
 
 // Find the next ';' and copy everything from '&' to ';' into `entity`
 if let semiRange = self.rangeOfString(";", range: position ..< endIndex) {
 let entity = self[position ..< semiRange.endIndex]
 position = semiRange.endIndex
 
 if let decoded = decode(entity) {
 // Replace by decoded character:
 result.append(decoded)
 } else {
 // Invalid entity, copy verbatim:
 result.appendContentsOf(entity)
 }
 } else {
 // No matching ';'.
 break
 }
 }
 // Copy remaining characters to `result`:
 result.appendContentsOf(self[position ..< endIndex])
 return result
 }
 }
 */
