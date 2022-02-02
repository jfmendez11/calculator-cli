# calculator-cli

## Usage

Make sure you have **Swift 5.5** installed in your local computer. If **Xcode** is available in your computer you can double click on the ```Package.swift``` file and it should launch the project (where tests and the project can be executed). Visual Studio Code is also availbe to review the code and execute the CLI through the command line.

Before running the first time, execute:
```$ swift build```

Afterward typing the previuous command is not necessary. To execute app run the following command:
```$ swift run```

To run test, execute the following commmand:
```$ swift test```

## File structure

```
  ├── ...
  ├── Sources
  |-----calculator-cli 
  │   ├── Calculator.swift 
  │   ├── Expression.swift
  |   ├── main.swift 
  │   └── Operator.swift
  └── Tests
  |-----calculator-cliTests
  │   ├── CalculatorTests.swift 
  │   ├── ExpressionTests.swift
  │   └── OperatorTests.swift
  └──
```

## Code description

The code consists of 4 files:
1. ```Calculator.swift```
2. ```Expression.swift```
3. ```Operator.swift```
4. ```main.swift```

The las file ```main.swift```, contains the code to execute the program through the command line.

The file ```Calculator.swift``` contains a static function that evaluates the ```Expression``` typed by the user.

The file ```Expression.swift``` contains all the logic to verify if the expression is valid and to tokenize the expression intto numeric values and ```Operator```s.

The file ```Operator.swift``` contains an ```enum``` with all the valid operators, their respecitve calculation and their precedence.

In the ```Test``` folder you can find all of the tests created to validate the tool's correct implementation.

## Calculator rules

1️⃣ Accepted operators: (+. -, *, /) ✅

2️⃣ No whitespaces or alphabetic character allowed ❌

3️⃣ Decimal values are allowed, only if the integer part and decimal part are present (e.g. .123, 123. are not allowed ❌)

4️⃣ Combinations of consecutive [+,-] are valid operators (e.g. +++-- will evaluate to +, --- will evaluate to -, +-+ will evaluate to -)

5️⃣ Consecutive values of [*,/] are not allowed, or consecutive combinations of these operators with other operators (e.g. */, **, *+. // are not allowed ❌)

6️⃣ Operator precedence: / > * > + > -

7️⃣ To exit, type 0, exit, done or ctrl + c
