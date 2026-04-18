 
# 📦 text_field_custom

A **highly customizable, reusable, and production-ready Flutter text field widget** with built-in support for titles, validation, theming, borders, icons, formatting, and more.

Designed to **reduce boilerplate**, **ensure UI consistency**, and **accelerate form development** across Flutter apps.

---

## ✨ Features

* ✅ Optional title with required indicator (*)
* ✅ Built-in validation support
* ✅ Prefix & suffix widget support
* ✅ Read-only, disabled & view-only modes
* ✅ Filled, outlined & custom border styles
* ✅ Input formatters, maxLength, multiline support
* ✅ Keyboard actions & focus control
* ✅ 🌗 **Dark & Light theme support (ThemeExtension)**
* ✅ 🎨 **Global styling via ThemeData**
* ✅ ⚡ Clean, scalable & production-ready API

---

## 📸 Preview

> Add screenshots or GIFs from `/example` for better engagement.

---

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  text_field_custom: ^2.0.0
```

Then run:

```bash
flutter pub get
```

---

## 📦 Import

```dart
import 'package:text_field_custom/text_field_custom.dart';
import 'package:text_field_custom/text_field_custom_theme.dart';
```

---

# 🧠 Theming (NEW 🚀)

You can now configure **global styles using ThemeExtension**.

## 🔥 Setup in `main.dart`

```dart
MaterialApp(
  theme: ThemeData(
    extensions: [
      TextFieldCustomTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Color(0xFFF5F5F5),
        filled: true,
        textStyle: TextStyle(fontSize: 14),
        hintStyle: TextStyle(color: Colors.grey),
        titleStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    ],
  ),
);
```

---

## 🌙 Dark Theme Support

```dart
darkTheme: ThemeData(
  brightness: Brightness.dark,
  extensions: [
    TextFieldCustomTheme(
      fillColor: Colors.grey.shade900,
      textStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: Colors.grey),
    ),
  ],
),
```

---

## 🎯 Styling Priority

```text
Widget parameter > ThemeExtension > Default values
```

This gives you **full flexibility + global consistency**.

---

# 🧱 Basic Usage

```dart
TextFieldCustom(
  title: "Email",
  hintText: "Enter your email",
  isRequired: true,
  validator: (v) {
    if (v == null || v.isEmpty) return "Email is required";
    if (!v.contains("@")) return "Invalid email";
    return null;
  },
)
```

---

# 🧩 Usage Examples

---

### 1️⃣ Simple Field

```dart
TextFieldCustom(
  title: "Name",
  hintText: "Enter your name",
)
```

---

### 2️⃣ Password Field

```dart
TextFieldCustom(
  title: "Password",
  hintText: "Enter password",
  obscureText: true,
)
```

---

### 3️⃣ Phone Field with Formatter

```dart
TextFieldCustom(
  title: "Phone",
  keyboardType: TextInputType.phone,
  maxLength: 10,
  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
)
```

---

### 4️⃣ Read-only Picker Field

```dart
TextFieldCustom(
  title: "Date of Birth",
  hintText: "Select date",
  readOnly: true,
  onTap: () {
    // Open date picker
  },
)
```

---

### 5️⃣ With Prefix & Suffix

```dart
TextFieldCustom(
  title: "Search",
  hintText: "Search",
  prefix: Icon(Icons.search),
  suffix: Icon(Icons.mic),
)
```

---

### 6️⃣ Multiline Text Field

```dart
TextFieldCustom(
  title: "Description",
  maxLines: 4,
)
```

---

### 7️⃣ Filled Style Field

```dart
TextFieldCustom(
  title: "Username",
  filled: true,
  fillColor: Colors.grey.shade100,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
  ),
)
```

---

### 8️⃣ Disabled / View-only Field

```dart
TextFieldCustom(
  title: "User ID",
  initialValue: "USR_12345",
  onlyText: true,
)
```

---

### 9️⃣ Override Global Theme Locally

```dart
TextFieldCustom(
  title: "Custom Field",
  filled: false,
  border: UnderlineInputBorder(),
)
```

---

## 🧪 Example App

A complete working example is available in:

```
/example
```

Run it:

```bash
cd example
flutter run
```

---

## 🧩 Available Parameters

| Parameter         | Description              |
| ----------------- | ------------------------ |
| `title`           | Label shown above field  |
| `hintText`        | Placeholder text         |
| `controller`      | TextEditingController    |
| `validator`       | Validation function      |
| `obscureText`     | Password mode            |
| `readOnly`        | Makes field readonly     |
| `enabled`         | Enables / disables field |
| `onlyText`        | View-only mode           |
| `prefix`          | Prefix widget            |
| `suffix`          | Suffix widget            |
| `filled`          | Filled background        |
| `fillColor`       | Background color         |
| `border`          | Custom border            |
| `keyboardType`    | Keyboard type            |
| `textInputAction` | Keyboard action          |
| `maxLines`        | Multiline support        |
| `maxLength`       | Character limit          |
| `inputFormatters` | Input formatters         |
| `onChanged`       | Change callback          |
| `onSubmitted`     | Submit callback          |

---

## 🏗️ Why use this package?

* 🚀 Reduces repetitive UI code
* 🎯 Standardizes form UI across apps
* 🎨 Centralized theming support
* 🧼 Clean and scalable architecture
* 📦 Easy to maintain and extend

---

## 🛣️ Roadmap

* [ ] Field variants (outlined / filled / borderless)
* [ ] Size system (small / medium / large)
* [ ] Built-in password toggle
* [ ] SearchField / DateField variants
* [ ] Form builder helpers

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

---

## 🧑‍💻 Author

**Amarjeet Srivastava**
Senior Flutter Developer

---

## 📄 License

MIT License
 