library text_field_custom;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? title;
  final bool obscureText;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final InputBorder? border;
  final String? initialValue;
  final bool isRequired;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Widget? prefix;
  final Color? textColor;
  final Widget? suffix;
  final int? maxLines;
  final double padding;
  final TextInputType? keyboardType;
  final bool onlyText;
  const TextFieldCustom({
    Key? key,
    this.border,
    this.controller,
    this.titleStyle,
    this.onTap,
    this.validator,
    this.onChanged,
    this.textColor,
    this.readOnly = false,
    this.initialValue,
    this.obscureText = false,
    this.autovalidateMode,
    this.keyboardType,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                            fontSize: 16),
                  ),
                  if (isRequired)
                    const Icon(
                      CupertinoIcons.staroflife_fill,
                      color: Colors.red,
                      size: 8,
                    )
                ],
              ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              readOnly: readOnly,
              initialValue: initialValue,
              controller: controller,
              autovalidateMode: autovalidateMode,
              inputFormatters: inputFormatters,
              maxLength: maxLength,
              onChanged: onChanged,
              keyboardType: keyboardType,
              maxLines: maxLines,
              obscureText: obscureText,
              enabled: !onlyText,
              validator: validator,
              style: hintStyle ??
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              decoration: InputDecoration(
                counterText: "",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                hintText: hintText,
                hintStyle: hintStyle ??
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                border: border ??
                    const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                    ),
                suffix: suffix,
              ),
            ),
            SizedBox(
              height: padding,
            ),
          ],
        ),
      ),
    );
  }
}
