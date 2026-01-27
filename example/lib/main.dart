import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_field_custom/text_field_custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextFieldCustom Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final searchController = TextEditingController();

  InputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1.2),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextFieldCustom Example"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _section(
                title: "Basic Fields",
                children: [
                  TextFieldCustom(
                    title: "Full Name",
                    hintText: "Enter your name",
                    controller: nameController,
                    isRequired: true,
                    border: border,
                    validator: Validations.nameValidation,
                  ),
                  TextFieldCustom(
                    title: "Email",
                    hintText: "Enter your email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    border: border,
                    validator: Validations.emailValidation,
                  ),
                ],
              ),
              _section(
                title: "Security & Input Control",
                children: [
                  TextFieldCustom(
                    title: "Password",
                    hintText: "Enter password",
                    controller: passwordController,
                    obscureText: true,
                    validator: Validations.passwordValidation,
                    border: border,
                  ),
                  TextFieldCustom(
                    title: "Phone",
                    hintText: "Enter phone number",
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: Validations.phoneValidation,
                    maxLength: 10,
                    border: border,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ],
              ),
              _section(
                title: "Advanced Usage",
                children: [
                  TextFieldCustom(
                    title: "Date of Birth",
                    hintText: "Select date",
                    readOnly: true,
                    border: border,
                    suffix: const Icon(Icons.calendar_month),
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                      );
                    },
                  ),
                  TextFieldCustom(
                    title: "Search",
                    hintText: "Search product",
                    controller: searchController,
                    border: border,
                    prefix: const Icon(Icons.search),
                    suffix: const Icon(Icons.mic),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (v) {},
                  ),
                ],
              ),
              _section(
                title: "UI Variants",
                children: [
                  TextFieldCustom(
                    title: "Description",
                    hintText: "Enter description",
                    maxLines: 4,
                    border: border,
                  ),
                  TextFieldCustom(
                    title: "Filled Field",
                    hintText: "Styled input",
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: border,
                  ),
                  TextFieldCustom(
                    title: "Read Only",
                    initialValue: "USR_204984",
                    onlyText: true,
                    border: border,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Form validated")),
                      );
                    }
                  },
                  child: const Text("Submit Form"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...children.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: e,
            ),
          ),
        ],
      ),
    );
  }
}
