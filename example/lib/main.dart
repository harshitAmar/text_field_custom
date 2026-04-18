import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_field_custom/text_field_custom.dart';

void main() {
  runApp(const MyApp());
}

/// Root App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextFieldCustom Demo',
      debugShowCheckedModeBanner: false,

      /// 🌞 Light Theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        extensions: [
          TextFieldCustomTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: const Color(0xFFF5F5F5),
            filled: true,
            textStyle: const TextStyle(fontSize: 14),
            hintStyle: const TextStyle(color: Colors.grey),
            titleStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),

      /// 🌙 Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        extensions: [
          TextFieldCustomTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Colors.grey.shade900,
            filled: true,
            textStyle: const TextStyle(color: Colors.white),
            hintStyle: const TextStyle(color: Colors.grey),
            titleStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),

      themeMode: ThemeMode.system,

      home: const DemoScreen(),
    );
  }
}

/// Demo Screen
class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFieldCustom Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// 📧 Email Field
              TextFieldCustom(
                title: "Email",
                hintText: "Enter your email",
                controller: emailController,
                isRequired: true,
                keyboardType: TextInputType.emailAddress,
                validator: Validations.emailValidation,
                prefix: const Icon(Icons.email),
              ),

              const SizedBox(height: 20),

              /// 🔒 Password Field
              TextFieldCustom(
                title: "Password",
                hintText: "Enter your password",
                controller: passwordController,
                obscureText: obscure,
                isRequired: true,
                validator: Validations.passwordValidation,
                prefix: const Icon(Icons.lock),
                suffix: IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// 📱 Phone Field (with formatter)
              TextFieldCustom(
                title: "Phone Number",
                hintText: "Enter phone number",
                keyboardType: TextInputType.number,
                validator: Validations.phoneValidation,
                maxLength: 10,
                inputFormatters: [
                  // digits only
                  FilteringTextInputFormatter.digitsOnly,
                ],
                prefix: const Icon(Icons.phone),
              ),

              const SizedBox(height: 20),

              /// 📝 Multiline Field
              const TextFieldCustom(
                title: "Address",
                hintText: "Enter your address",
                validator: Validations.fieldValidation,
                maxLines: 3,
                prefix: Icon(Icons.home),
              ),

              const SizedBox(height: 20),

              /// 🔒 Readonly Field
              const TextFieldCustom(
                title: "Readonly Field",
                hintText: "You cannot edit this",
                readOnly: true,
                initialValue: "Fixed Value",
              ),

              const SizedBox(height: 20),

              /// 🎯 Local Override Example
              const TextFieldCustom(
                title: "Custom Styled Field",
                hintText: "Overrides theme",
                filled: false,
                border: UnderlineInputBorder(),
              ),

              const SizedBox(height: 30),

              /// ✅ Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Form Valid ✅")),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
