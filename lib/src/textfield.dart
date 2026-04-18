library text_field_custom;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_field_custom_theme.dart';

/// A highly customizable reusable `TextFormField` widget.
///
/// ## ✨ Features
/// - Optional title with required indicator (*)
/// - Built-in validation support
/// - Prefix & suffix widget support
/// - Supports read-only, disabled, and text-only modes
/// - Fully customizable borders, styles, and layout
/// - Integrated with [TextFieldCustomTheme] via ThemeExtension
///
/// ## 🎯 Styling Priority
/// Styling is applied in the following order:
/// ```
/// Widget parameter > ThemeExtension > Default values
/// ```
///
/// ## 📌 Example
/// ```dart
/// TextFieldCustom(
///   title: "Email",
///   hintText: "Enter your email",
///   isRequired: true,
///   validator: (v) => v!.isEmpty ? "Required" : null,
/// )
/// ```
class TextFieldCustom extends StatelessWidget {
  /// Placeholder text shown inside the input field
  final String? hintText;

  /// Validation function for form validation
  final String? Function(String?)? validator;

  /// Controller to manage text input
  /// Cannot be used together with [initialValue]
  final TextEditingController? controller;

  /// Title displayed above the input field
  final String? title;

  /// If true, hides the text (useful for passwords)
  final bool obscureText;

  /// Custom style for the title text
  final TextStyle? titleStyle;

  /// Custom style for hint text
  final TextStyle? hintStyle;

  /// Makes the field read-only (user cannot edit but can tap)
  final bool readOnly;

  /// Enables or disables the field completely
  final bool enabled;

  /// Callback when the field is tapped
  final VoidCallback? onTap;

  /// Callback triggered when text changes
  final Function(String)? onChanged;

  /// Callback triggered when user submits input (done/enter)
  final Function(String)? onSubmitted;

  /// Base border for the input field
  final InputBorder? border;

  /// Initial value of the field (used when controller is null)
  final String? initialValue;

  /// If true, shows a red star (*) next to the title
  final bool isRequired;

  /// Auto validation behavior
  final AutovalidateMode? autovalidateMode;

  /// Input formatters (e.g., digits only, uppercase)
  final List<TextInputFormatter>? inputFormatters;

  /// Maximum allowed character length
  final int? maxLength;

  /// Widget displayed before the input (icon/text)
  final Widget? prefix;

  /// Widget displayed after the input (icon/text)
  final Widget? suffix;

  /// Optional text color override
  final Color? textColor;

  /// Background color when [filled] is true
  final Color? fillColor;

  /// Whether the input field has a filled background
  final bool filled;

  /// Maximum number of lines (for multiline input)
  final int? maxLines;

  /// Bottom spacing after the field
  final double padding;

  /// Keyboard type (text, number, email, etc.)
  final TextInputType? keyboardType;

  /// Keyboard action button (next, done, etc.)
  final TextInputAction? textInputAction;

  /// Focus node for managing focus state
  final FocusNode? focusNode;

  /// If true, disables editing and behaves like plain text
  final bool onlyText;

  /// Custom text style for input text
  final TextStyle? style;

  /// Border when validation error occurs
  final InputBorder? errorBorder;

  /// Border when field is focused
  final InputBorder? focusedBorder;

  /// Border when focused and error occurs
  final InputBorder? focusedErrorBorder;

  /// Border when field is disabled
  final InputBorder? disabledBorder;

  /// Border when field is enabled
  final InputBorder? enabledBorder;

  const TextFieldCustom({
    super.key,
    this.border,
    this.controller,
    this.titleStyle,
    this.onTap,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.textColor,
    this.readOnly = false,
    this.enabled = true,
    this.initialValue,
    this.obscureText = false,
    this.autovalidateMode,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.padding = 0,
    this.isRequired = false,
    this.title,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.hintStyle,
    this.suffix,
    this.prefix,
    this.hintText,
    this.onlyText = false,
    this.filled = false,
    this.fillColor,
    this.style,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
  });

  @override
  Widget build(BuildContext context) {
    /// 🔥 Fetch ThemeExtension (if provided in ThemeData)
    final theme = Theme.of(context).extension<TextFieldCustomTheme>();

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 📌 Title Section (optional)
          if (title != null)
            Row(
              children: [
                Text(
                  title!,

                  /// Priority: Widget > Theme > Default
                  style:
                      titleStyle ??
                      theme?.titleStyle ??
                      TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                ),

                /// Required indicator (*)
                if (isRequired)
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(
                      CupertinoIcons.staroflife_fill,
                      color: Colors.red,
                      size: 8,
                    ),
                  ),
              ],
            ),

          const SizedBox(height: 10),

          /// ✏️ Input Field
          TextFormField(
            focusNode: focusNode,
            onTap: onTap,

            /// Disable if either `enabled` is false OR `onlyText` is true
            enabled: enabled && !onlyText,

            readOnly: readOnly,
            initialValue: initialValue,
            controller: controller,
            autovalidateMode: autovalidateMode,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            maxLines: maxLines,
            obscureText: obscureText,
            validator: validator,

            /// Text Style (priority applied)
            style:
                style ??
                theme?.textStyle ??
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),

            decoration: InputDecoration(
              counterText: "", // hides maxLength counter
              /// Background fill
              filled: filled || (theme?.filled ?? false),
              fillColor: fillColor ?? theme?.fillColor,

              /// Prefix & suffix widgets
              prefixIcon: prefix,
              suffixIcon: suffix,

              /// Inner padding
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),

              hintText: hintText,

              /// Hint style (priority applied)
              hintStyle:
                  hintStyle ??
                  theme?.hintStyle ??
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),

              enabled: enabled,

              /// 🎯 Borders (priority applied)
              enabledBorder:
                  enabledBorder ??
                  theme?.enabledBorder ??
                  border ??
                  theme?.border ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.5),
                  ),

              focusedBorder:
                  focusedBorder ??
                  theme?.focusedBorder ??
                  border ??
                  theme?.border ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.5),
                  ),

              errorBorder:
                  errorBorder ??
                  theme?.errorBorder ??
                  border ??
                  theme?.border ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.5),
                  ),

              focusedErrorBorder:
                  focusedErrorBorder ??
                  theme?.focusedErrorBorder ??
                  border ??
                  theme?.border ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.5),
                  ),

              disabledBorder:
                  disabledBorder ??
                  theme?.disabledBorder ??
                  border ??
                  theme?.border ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.5),
                  ),

              border:
                  border ??
                  theme?.border ??
                  const UnderlineInputBorder(
                    borderSide: BorderSide(width: 1.5),
                  ),
            ),
          ),

          /// Bottom spacing
          SizedBox(height: padding),
        ],
      ),
    );
  }
}
