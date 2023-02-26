import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextStyle SafeGoogleFont(
  String fontFamily, {
  TextStyle? textStyle,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  try {
    return GoogleFonts.getFont(
      fontFamily,
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  } catch (ex) {
    return GoogleFonts.getFont(
      "Source Sans Pro",
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}

Future<bool> reset({bool clear = false, bool debug = false}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (clear) {
    await prefs.clear();
  }
  if (prefs.getStringList('items') == null) {
    if (debug) {
      await prefs.setStringList('items', <String>[
        '{"name":"Food", "description":"Hachiban", "price":"1000", "date":"2023-02-24 16:50:00.000", "is_income":"true"}',
        '{"name":"Food", "description":"Beef35", "price":"1000.5", "date":"2023-02-24 16:50:00.000", "is_income":"false"}',
        '{"name":"TheGang", "description":"Salary", "price":"3000", "date":"2023-02-24 16:50:00.000", "is_income":"true"}'
      ]);
    } else {
      await prefs.setStringList('items', <String>[]);
    }
  }
  if (prefs.getDouble('income') == null) {
    await prefs.setDouble('income', 0);
  }
  return true;
}

Future<bool> delete(int index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> items = prefs.getStringList('items') ?? [];
  items.removeAt(index);
  await prefs.setStringList('items', items);
  return true;
}
