import 'package:flutter/material.dart';
import 'package:my_notes_app/ui/resources/color_manager.dart';

class NoteTheme {
 static TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: TextDecoration.none
    );
  }

  static ThemeData getNoteTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      textTheme:  TextTheme(
        titleLarge: _getTextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: NoteColor.white),
        titleMedium: _getTextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: NoteColor.black),
        titleSmall:  _getTextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: NoteColor.black.withOpacity(0.6)),
        labelMedium:  _getTextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: NoteColor.white),
        labelSmall: _getTextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: NoteColor.black.withOpacity(0.5)),
      ),
    );
  }
}

