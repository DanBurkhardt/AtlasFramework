public struct Country {
    public let code: String
    public let message: String
    
    public init(code: String, message: String) {
        self.code = code.uppercased()
        self.message = message
    }
    
    public var emojiFlag: String {
        return code.unicodeScalars.map { String(regionalIndicatorSymbol(unicodeScalar: $0)!) } .joined()
    }
    
    func regionalIndicatorSymbol(unicodeScalar: UnicodeScalar) -> UnicodeScalar? {
        let uppercaseA = UnicodeScalar("A")!
        let regionalIndicatorSymbolA = UnicodeScalar("\u{1f1e6}")!
        let distance = unicodeScalar.value - uppercaseA.value
        return UnicodeScalar(regionalIndicatorSymbolA.value + distance)
    }
    
    // Test function
    public var returnMessage: String{
        return "You said: \(self.message)"
    }
}
