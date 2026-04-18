 ## 1.0.0

🚀 Major release with theming and architecture improvements

### ✨ Added
* Introduced `TextFieldCustomTheme` using Flutter `ThemeExtension`
* Added global styling support via `ThemeData.extensions`
* Added dark mode compatibility out of the box
* Added consistent styling fallback system:
  - Widget params > ThemeExtension > Default values
* Improved documentation with theming examples
* Enhanced example app with real-world form use cases

### 🔄 Updated
* Refactored `TextFieldCustom` to support ThemeExtension
* Improved internal architecture for scalability and maintainability
* Updated README with theming, dark mode, and advanced usage

### 🛠 Improvements
* Cleaner and more flexible styling system
* Better separation of concerns (UI vs configuration)
* Production-ready theming support

### ⚠️ Breaking Changes
* Deprecated previous global configuration approach (if used)
* Styling is now recommended via `ThemeExtension`

---

## 0.0.3

### ✨ Added
* Added validation support for better form handling

### 🛠 Improvements
* Improved validation approach and usability

---

## 0.0.2

### ✨ Added
* Added documentation
* Added example app for better understanding

---

## 0.0.1

### 🎉 Initial Release
* Basic implementation of customizable text field
* Support for title, hint, validation, and styling options
