import 'package:flutter/material.dart';
import 'package:memorable/utilities/color_style.dart';
import 'package:memorable/utilities/text_style.dart';

class AppTheme {
  AppTheme._();

  static final TextTheme _textTheme = TextTheme(
    displayLarge: largeTitle, // LargeTitle
    displayMedium: title, // Title
    displaySmall: body1, // Body1
    headlineLarge: body2, // Body2
    headlineMedium: body2, // Body2
    headlineSmall: body2, // Body2
    titleLarge: bodyCaption, // BodyCaption
    titleMedium: bodyCaption, // BodyCaption
    titleSmall: bodyCaption, // BodyCaption
    bodyLarge: body1,
    bodyMedium: body2,
    bodySmall: bodyCaption,
    labelLarge: button,
    labelMedium: button,
    labelSmall: button,
  );

  static const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: orange,
    onPrimary: green,
    secondary: blue,
    onSecondary: blue1,
    error: red,
    onError: red,
    surface: gray3,
    onSurface: black,
  );

  static final ThemeData regularTheme = ThemeData(
    fontFamily: 'Pretendard',
    textTheme: _textTheme,
    colorScheme: _colorScheme,
    focusColor: blue1,
    buttonTheme: const ButtonThemeData(
      buttonColor: blue1,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: title.copyWith(color: white),
    ),
    iconTheme: const IconThemeData(
      color: white,
      size: 24,
    ),
  );
}
