func shortNum4(_ n: Int) -> String {
    func smartRound(_ n: Int, to digit: Int) -> String {
        let nDiv = Float(n) / pow(10,Float(digit))
        let nString = String(nDiv)
        
        // Check if the . is right before the K (removes things like 22.K or 10.K)
        let index3 = nString.index(nString.startIndex, offsetBy: 2)
        let indexDot = nString.firstIndex(of: ".")
        if indexDot == index3 { return String(nString.prefix(2)) }
        
        // Number has trailing .0
        let first3Digits = Float(nString.prefix(3)) ?? 0
        if first3Digits == floor(first3Digits) {
            return String((nString.split(separator: ".").first ?? Substring(nString)).prefix(3))
        }
        
        // Otherwise return the first 3 digits if the . is in the center
        return String(nString.prefix(3))
    }
    
    switch Float(n) {
    case 0..<1000:
        return String(n)
    case 1000..<1000000:
        return smartRound(n, to: 3) + "K"
    case 1000000..<1000000000:
        return smartRound(n, to: 6) + "M"
    default:
        let nString = String(n)
        let powString = String(nString.count - 1)
        return nString.prefix(1) + "E" + powString.prefix(2)
    }
}
