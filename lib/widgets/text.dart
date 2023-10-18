import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skripsi_kos_app/themes/colors/colors.dart';

class ReText extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String text;
  final bool isHeading;
  final bool? softWrap;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final int maxLines;
  const ReText({
    super.key,
    this.margin = const EdgeInsets.all(2),
    required this.text,
    this.isHeading = false,
    this.softWrap,
    this.textAlign,
    this.textOverflow,
    this.fontSize = 16,
    this.color = ColorsTheme.primary,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        text,
        softWrap: softWrap,
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
        style: isHeading
            ? GoogleFonts.poppins(
                fontSize: fontSize,
                color: color,
                fontWeight: fontWeight,
              )
            : GoogleFonts.sourceSansPro(
                fontSize: fontSize,
                color: color,
                fontWeight: fontWeight,
              ),
      ),
    );
  }
}
