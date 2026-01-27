
# 📦 text_field_custom

A **highly customizable, reusable, and production-ready Flutter text field widget** with built-in support for titles, validation, borders, icons, formatting, read-only mode, and many UI configurations.

Designed to **reduce boilerplate**, **improve consistency**, and **speed up form development** across Flutter projects.

---

## ✨ Features

* ✅ Optional title with required indicator
* ✅ Built-in validation support
* ✅ Supports prefix & suffix widgets
* ✅ Supports readonly & disabled fields
* ✅ Supports filled & outlined styles
* ✅ Supports formatters, maxLength, multiline
* ✅ Supports keyboard actions & focus control
* ✅ Clean, reusable & production-ready API

---

## 📸 Preview

> You can add screenshots here later from the example app.

---

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  text_field_custom: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 📦 Import

```dart
import 'package:text_field_custom/text_field_custom.dart';
```

---

## 🧱 Basic Usage

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

## 🧩 Usage Examples

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

## 🧪 Example App

A complete example app is available in the:

```
/example
```

folder.

Run it using:

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
* 🧼 Clean and scalable architecture
* 📦 Easy to maintain and extend

---

## 🛣️ Roadmap

* [ ] Theme presets
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
