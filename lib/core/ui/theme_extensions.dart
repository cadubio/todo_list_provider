import 'package:flutter/material.dart';

extension ThemeExtenssion on BuildContext {
  // O [this] recebe um [BuidContext] como contexto.
  //Color get primaryColor => Theme.of(this).primaryColor.withAlpha(20);
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  //ButtonTheme get buttonColor => ButtonTheme.of(this).;
  ButtonThemeData get buttonColor => Theme.of(this).buttonTheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get titleStyle => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      );
}
