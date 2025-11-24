# Flutter Calculator

A modern, responsive calculator app built with Flutter that works across iOS, Android, web, and desktop platforms.

## Features

- ✨ **Basic Operations**: Addition, subtraction, multiplication, and division
- 🔢 **Advanced Functions**: Support for parentheses, decimal numbers, and negative numbers
- ➕➖ **Plus/Minus Toggle**: Toggle between positive and negative numbers with `(-56)` notation
- ⌫ **Backspace**: Remove the last entered character
- 🔄 **Clear Function**: Reset calculator to initial state
- 📱 **Responsive Design**: Adapts to different screen sizes (4 columns on mobile, 5 on wider screens)
- 🎨 **Material Design**: Clean UI using Material 3 color scheme
- 🧮 **Order of Operations**: Respects mathematical precedence rules

## Architecture

The app follows Flutter best practices with a clean architecture:

```
lib/
├── main.dart                    # App entry point
├── managers/
│   └── calculator_manager.dart  # Business logic & state management
├── views/
│   └── calculator_view.dart     # Main calculator screen
├── widgets/
│   ├── display_widget.dart      # Display area for calculations
│   └── numpad_widget.dart       # Button grid layout
└── utils/
    ├── button_config.dart       # Button constants and configuration
    ├── layout_constants.dart    # Responsive layout breakpoints
    └── responsive_helpers.dart  # Responsive layout utilities
```

## Key Components

### CalculatorManager (Singleton)

Manages calculator state and business logic, handling:

- Button press events
- Calculation evaluation using `math_expressions` package
- Plus/minus toggle logic with parentheses support

### Responsive Design

- Uses `LayoutBuilder` and `ConstrainedBox` for adaptive layouts
- Breakpoint at 450px for column count (4 vs 5 columns)
- Maximum width constraint of 600px on wider screens
- Dynamic button aspect ratios and spacing

## Testing

Comprehensive test coverage with 21+ unit and widget tests:

```bash
# Run all tests
flutter test

# Run specific test files
flutter test test/calculator_manager_test.dart
flutter test test/widget_test.dart
```

Test coverage includes:

- Basic arithmetic operations
- Complex expressions with parentheses
- Plus/minus toggle functionality
- Edge cases and error handling
- Widget interactions

## Getting Started

### Prerequisites

- Flutter SDK (^3.9.2)
- Dart SDK

### Installation

1. Clone the repository:

```bash
git clone https://github.com/joba/flutterCalculator.git
cd flutterCalculator
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

### Running on Specific Platforms

```bash
# iOS Simulator
flutter run -d iPhone

# Android Emulator
flutter run -d emulator

# Web Browser
flutter run -d chrome

# Desktop
flutter run -d macos    # macOS
flutter run -d windows  # Windows
flutter run -d linux    # Linux
```

## Dependencies

- `flutter`: Flutter SDK
- `math_expressions: ^3.1.0`: Mathematical expression parser and evaluator

## Development

### Project Structure Best Practices

- ✅ Separation of concerns (views, widgets, utils, managers)
- ✅ Singleton pattern for state management
- ✅ Extracted constants for magic strings and values
- ✅ Responsive design utilities
- ✅ Type-safe function signatures
- ✅ Comprehensive error handling
- ✅ Unit and widget test coverage

### Code Style

The project follows official Dart/Flutter linting rules with `flutter_lints: ^5.0.0`.

Run linter:

```bash
flutter analyze
```

Format code:

```bash
flutter format .
```
