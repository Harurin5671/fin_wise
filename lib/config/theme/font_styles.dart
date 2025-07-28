import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  /// Estilos Poppins
  static _Poppins get poppins => _Poppins();

  /// Estilos League Spartan
  static _LeagueSpartan get leagueSpartan => _LeagueSpartan();

  /// Estilos Inter
  static _Inter get inter => _Inter();
}

/// ──────────────────────────────
/// Poppins styles
class _Poppins {
  final thin = GoogleFonts.poppins(fontWeight: FontWeight.w200);
  final light = GoogleFonts.poppins(fontWeight: FontWeight.w300);
  final regular = GoogleFonts.poppins(fontWeight: FontWeight.w400);
  final medium = GoogleFonts.poppins(fontWeight: FontWeight.w500);
  final semiBold = GoogleFonts.poppins(fontWeight: FontWeight.w600);
  final bold = GoogleFonts.poppins(fontWeight: FontWeight.w700);

  TextStyle get title => GoogleFonts.poppins(
        fontSize: 20,
        height: 22 / 20,
        fontWeight: FontWeight.w600,
      );

  TextStyle get paragraph => GoogleFonts.poppins(
        fontSize: 13,
        height: 15 / 13,
        fontWeight: FontWeight.w400,
      );

  TextStyle get subtitle => GoogleFonts.poppins(
        fontSize: 15,
        height: 1.2,
        fontWeight: FontWeight.w500,
      );

  TextStyle get subtext => GoogleFonts.poppins(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w400,
      );
}

/// ──────────────────────────────
/// League Spartan styles
class _LeagueSpartan {
  final thin = GoogleFonts.leagueSpartan(fontWeight: FontWeight.w200);
  final light = GoogleFonts.leagueSpartan(fontWeight: FontWeight.w300);
  final regular = GoogleFonts.leagueSpartan(fontWeight: FontWeight.w400);
  final medium = GoogleFonts.leagueSpartan(fontWeight: FontWeight.w500);
  final semiBold = GoogleFonts.leagueSpartan(fontWeight: FontWeight.w600);
  final bold = GoogleFonts.leagueSpartan(fontWeight: FontWeight.w700);

  TextStyle get title => GoogleFonts.leagueSpartan(
        fontSize: 20,
        height: 22 / 20,
        fontWeight: FontWeight.w600,
      );

  TextStyle get paragraph => GoogleFonts.leagueSpartan(
        fontSize: 13,
        height: 15 / 13,
        fontWeight: FontWeight.w400,
      );

  TextStyle get subtitle => GoogleFonts.leagueSpartan(
        fontSize: 15,
        height: 1.2,
        fontWeight: FontWeight.w500,
      );

  TextStyle get subtext => GoogleFonts.leagueSpartan(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w400,
      );
}

/// ──────────────────────────────
/// Inter styles
class _Inter {
  final thin = GoogleFonts.inter(fontWeight: FontWeight.w200);
  final light = GoogleFonts.inter(fontWeight: FontWeight.w300);
  final regular = GoogleFonts.inter(fontWeight: FontWeight.w400);
  final medium = GoogleFonts.inter(fontWeight: FontWeight.w500);
  final semiBold = GoogleFonts.inter(fontWeight: FontWeight.w600);
  final bold = GoogleFonts.inter(fontWeight: FontWeight.w700);

  TextStyle get title => GoogleFonts.inter(
        fontSize: 20,
        height: 22 / 20,
        fontWeight: FontWeight.w600,
      );

  TextStyle get paragraph => GoogleFonts.inter(
        fontSize: 13,
        height: 15 / 13,
        fontWeight: FontWeight.w400,
      );

  TextStyle get subtitle => GoogleFonts.inter(
        fontSize: 15,
        height: 1.2,
        fontWeight: FontWeight.w500,
      );

  TextStyle get subtext => GoogleFonts.inter(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w400,
      );
}
