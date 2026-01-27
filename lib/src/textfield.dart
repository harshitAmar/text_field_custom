library text_field_custom;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A highly customizable reusable TextFormField widget.
///
/// Features:
/// - Optional title with required indicator
/// - Supports validation, formatting, prefix/suffix widgets
/// - Supports readonly, disabled, and text-only modes
/// - Configurable styles, borders, padding, and keyboard behavior
///
/// Example:
/// ```dart
/// TextFieldCustom(
///   title: "Email",
///   hintText: "Enter your email",
///   isRequired: true,
///   validator: (v) => v!.isEmpty ? "Required" : null,
/// )
/// ```
class TextFieldCustom extends StatelessWidget {
  /// Placeholder text
  final String? hintText;

  /// Validation function
  final String? Function(String?)? validator;

  /// Text controller
  final TextEditingController? controller;

  /// Field title shown above input
  final String? title;

  /// Obscure text (for password fields)
  final bool obscureText;

  /// Style for title text
  final TextStyle? titleStyle;

  /// Style for input text & hint
  final TextStyle? hintStyle;

  /// Makes field readonly
  final bool readOnly;

  /// Disables the field completely
  final bool enabled;

  /// Tap callback
  final VoidCallback? onTap;

  /// Change callback
  final Function(String)? onChanged;

  /// Submit callback
  final Function(String)? onSubmitted;

  /// Input border
  final InputBorder? border;

  /// Initial value
  final String? initialValue;

  /// Shows red star if true
  final bool isRequired;

  /// Auto validation mode
  final AutovalidateMode? autovalidateMode;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Max length
  final int? maxLength;

  /// Prefix widget
  final Widget? prefix;

  /// Suffix widget
  final Widget? suffix;

  /// Text color
  final Color? textColor;

  /// Background color
  final Color? fillColor;

  /// Whether field is filled
  final bool filled;

  /// Max lines
  final int? maxLines;

  /// Bottom spacing
  final double padding;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Keyboard action
  final TextInputAction? textInputAction;

  /// Focus node
  final FocusNode? focusNode;

  /// If true, field becomes text-only (disabled)
  final bool onlyText;

  const TextFieldCustom({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Row(
                children: [
                  Text(
                    title!,
                    style: titleStyle ??
                        TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                  ),
                  if (isRequired)
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(
                        CupertinoIcons.staroflife_fill,
                        color: Colors.red,
                        size: 8,
                      ),
                    )
                ],
              ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: focusNode,
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
              style: hintStyle ??
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              decoration: InputDecoration(
                counterText: "",
                filled: filled,
                fillColor: fillColor,
                prefixIcon: prefix,
                suffixIcon: suffix,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                hintText: hintText,
                hintStyle: hintStyle ??
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                border: border ??
                    const UnderlineInputBorder(
                      borderSide: BorderSide(width: 1.5),
                    ),
              ),
            ),
            SizedBox(height: padding),
          ],
        ),
      ),
    );
  }
}
