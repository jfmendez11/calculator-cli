final class Main {
    enum ExitCodes: String {
        case zero = "0"
        case exit
        case done
    }
    
    private static var rules: String {
        return """
            1️⃣ Accepted operators: (+. -, *, /) ✅
            2️⃣ No whitespaces or alphabetic character allowed ❌
            3️⃣ Decimal values are allowed, only if the integer part and decimal part are present (e.g. .123, 123. are not allowed ❌)
            4️⃣ Combinations of consecutive [+,-] are valid operators (e.g. +++-- will evaluate to +, --- will evaluate to -, +-+ will evaluate to -)
            5️⃣ Consecutive values of [*,/] are not allowed, or consecutive combinations of these operators with other operators (e.g. */, **, *+. // are not allowed ❌)
            6️⃣ Operator precedence: / > * > + > -
            7️⃣ To exit, type 0, exit, done or ctrl + c
        """
    }
    
    private static func printIntro() {
        let text = """
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        Welcome to Swift Calculator CLI 🤓
        The tool evaluates simple mathematic expressions 🧮
        
        Bare in mind 🤔
        \(rules)
        
        Enjoy calculating! 😎
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        
        Typed a math expression:
        """
        print(text)
    }
    
    static func run() {
        Self.printIntro()
        while let userInput = readLine(),
              ExitCodes(rawValue: userInput) == nil {
            if let expression = Expression(expression: userInput) {
                let result = Calculator.evaluate(expression: expression)
                if result.isNaN {
                    print("Oooops, cannot divide by 0 🤯")
                } else {
                    print("\n\(userInput) = \(result)")
                }
            } else {
                print("\nYou typed an invalid character 😥.\nRemember the accepted characters:\n\(rules)")
            }
            print("\nType another math expression:")
        }
    }
}

Main.run()
