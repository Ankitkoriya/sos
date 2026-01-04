import 'package:flutter/material.dart';

class ColorConstant {
  // BASIC COLORS
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color colorGreen = Colors.green;
  static const Color colorOrange = Colors.orange;
  static const Color colorRed = Colors.red;
  static const Color colorGrey = Colors.grey;

  // ALERTONE BRAND COLORS

  /// Primary emergency color (SOS button, alerts)
  static const Color alertRed = Color(0xFFE53935);

  /// App main background (splash + screens)
  static const Color darkBackground = Color(0xFF0D1117);

  /// Card / surface background
  static const Color cardBackground = Color(0xFF161B22);

  /// Divider / border color
  static const Color divider = Color(0xFF2A2F3A);

  /// Main text color
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// Secondary text (hint, subtitle)
  static const Color textSecondary = Color(0xFF9AA4B2);

  /// Safe / success state (SOS stopped)
  static const Color safeGreen = Color(0xFF2ECC71);

  /// Info / location / links
  static const Color infoBlue = Color(0xFF1E88E5);

  /// Warning (optional)
  static const Color warningYellow = Color(0xFFFBC02D);

  // TRANSPARENT COLORS
  static const Color blackTransparent = Color(0x50000000);
  static const Color redTransparent = Color(0x33E53935);
}
