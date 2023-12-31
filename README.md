<p align="center">
  </br><img width="300px" src=".github/logo.svg"></br>
</p>

# Syntactic Sugar for Swift (SSS)

![example workflow](https://github.com/eligutovsky/SyntacticSugar/actions/workflows/swift.yml/badge.svg)

> In computer science, syntactic sugar is syntax within a programming language that is designed to make things easier to read or to express. It makes the language "sweeter" for human use: things can be expressed more clearly, more concisely, or in an alternative style that some may prefer. [Wikipedia](https://en.wikipedia.org/wiki/Syntactic_sugar)


## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Syntactic Sugar for Swift (SSS) is a powerful Swift Package Manager (SPM) package designed to enhance the readability and expressiveness of your Swift code. It provides a collection of convenient syntactic sugar, simplifying common coding patterns and reducing boilerplate code, all while maintaining the robustness and performance of the Swift language.

With SSS, you can write cleaner and more concise Swift code without sacrificing clarity or readability. This package is intended to be a helpful tool for Swift developers looking to streamline their code and make it more enjoyable to write.

## Installation

You can install Syntactic Sugar for Swift using Swift Package Manager (SPM). To add it to your project, follow these steps:

1. In Xcode, open your project.
2. Go to "File" > "Swift Packages" > "Add Package Dependency".
3. Enter the URL of this repository: `https://github.com/eligutovsky/SyntacticSugar.git`.
4. Choose the version or branch that you want to use.
5. Click "Next" and follow the instructions to complete the installation.

Alternatively, you can also add SSS as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/eligutovsky/SyntacticSugar.git", from: "1.0.0")
]
```

Replace `1.0.0` with the desired version or range.


## Usage

To use Syntactic Sugar for Swift in your project, simply import the module at the beginning of your Swift files:

```swift
import SyntacticSugar
```

After importing the module, you can start leveraging the provided syntactic sugar in your code.

## Features

SSS comes with a variety of features to improve the readability and simplicity of your Swift code. Some of the key features include:

- [Optional Unwrapping](#optional-unwrapping)
- [Optional Casting](#optional-casting)
- [SugarError](#sugarerror)

### Optional Unwrapping

SSS provides a variety of convenient methods for unwrapping optionals. These methods are designed to reduce the amount of boilerplate code required to unwrap optionals, while also improving the readability of your code.

#### `unwrap()`

The `unwrap()` method is a convenient way to unwrap an optional value. It returns the unwrapped value if it is not `nil`, or throws an error if the value is `nil`. This method is useful when you want to throw an error if an optional value is `nil`, but you don't want to use `guard` or `if let` statements.

```swift
let optionalString: String? = "Hello, world!"

// Unwrap the optional value
let string = try unwrap(optionalString)

print(string) // Prints "Hello, world!"
```

### Optional Casting

SSS provides a variety of convenient methods for casting optionals to different types. These methods are designed to reduce the amount of boilerplate code required to cast optionals, while also improving the readability of your code.

#### `cast()`

The `cast()` method is a convenient way to cast an optional value to a different type. It returns the casted value if the cast is successful, or throws an error if the cast fails. This method is useful when you want to throw an error if an optional value cannot be casted to a different type, but you don't want to use `guard` or `if let` statements.

```swift
let optionalString: String? = "Hello, world!"

// Cast the optional value to a different type
let string: String = try cast(optionalString)

print(string) // Prints "Hello, world!"
```

### `SugarError`

The `SugarError` enum is a convenient way to represent errors that occur when unwrapping optionals or casting values. It contains a variety of cases that represent different types of errors, including:

- `failedToUnwrap`: The optional value was `nil`.
- `unableCast`: The optional value could not be casted to the specified type.
- `custom`: A custom error message.

```swift
let optionalString: String? = nil

do {
    // Unwrap the optional value
    let string = try unwrap(optionalString)
} catch SugarError.failedToUnwrap {
    print("The optional value was nil.")
} catch {
    print("An unknown error occurred.")
}
```

```swift
let optionalString: String? = "Hello, world!"

do {
    // Cast the optional value to a different type
    let string: Int = try cast(optionalString)
} catch SugarError.unableCast {
    print("The optional value could not be casted to the specified type.")
} catch {
    print("An unknown error occurred.")
}
```

```swift
let optionalString: String? = nil

do {
    // Unwrap the optional value
    let string = try unwrap(optionalString)
} catch SugarError.custom(let message) {
    print(message)
} catch {
    print("An unknown error occurred.")
}
```

## Contributing

We welcome contributions from the community to improve Syntactic Sugar for Swift. If you have suggestions for new features, bug fixes, or any other improvements, please feel free to open issues and pull requests on our GitHub repository.

When contributing, please adhere to our code of conduct and ensure that your changes align with the project's goals and coding standards.

## License

Syntactic Sugar for Swift is licensed under the MIT License. You can find the full license text in the [LICENSE](https://github.com/eligutovsky/SyntacticSugar/blob/master/LICENSE) file. Feel free to use, modify, and distribute this package as per the terms of the MIT License.
