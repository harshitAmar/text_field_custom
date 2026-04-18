import 'package:flutter/material.dart';

@immutable
class TextFieldCustomTheme extends ThemeExtension<TextFieldCustomTheme> {
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;

  final Color? fillColor;
  final bool? filled;

  const TextFieldCustomTheme({
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.textStyle,
    this.hintStyle,
    this.titleStyle,
    this.fillColor,
    this.filled,
  });

  /// CopyWith (important for theme updates)
  @override
  TextFieldCustomTheme copyWith({
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? disabledBorder,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    TextStyle? titleStyle,
    Color? fillColor,
    bool? filled,
  }) {
    return TextFieldCustomTheme(
      border: border ?? this.border,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      textStyle: textStyle ?? this.textStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      fillColor: fillColor ?? this.fillColor,
      filled: filled ?? this.filled,
    );
  }

  /// Required for smooth theme animation (light ↔ dark)
  @override
  TextFieldCustomTheme lerp(
    ThemeExtension<TextFieldCustomTheme>? other,
    double t,
  ) {
    if (other is! TextFieldCustomTheme) return this;

    return TextFieldCustomTheme(
      border: t < 0.5 ? border : other.border,
      enabledBorder: t < 0.5 ? enabledBorder : other.enabledBorder,
      focusedBorder: t < 0.5 ? focusedBorder : other.focusedBorder,
      errorBorder: t < 0.5 ? errorBorder : other.errorBorder,
      focusedErrorBorder:
          t < 0.5 ? focusedErrorBorder : other.focusedErrorBorder,
      disabledBorder: t < 0.5 ? disabledBorder : other.disabledBorder,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      hintStyle: TextStyle.lerp(hintStyle, other.hintStyle, t),
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
      fillColor: Color.lerp(fillColor, other.fillColor, t),
      filled: t < 0.5 ? filled : other.filled,
    );
  }
}
