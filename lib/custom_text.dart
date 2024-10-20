import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  const MyText({
    super.key,
    required this.text,
    this.textSize,
    this.textColor,
    this.textWeight,
    this.textFontStyle,
    this.textHeight,
    this.textAlign,
    this.isTextOverflow,
    this.overflow,
    this.maxLines,
    this.letterSpacing,
    this.fontfamily,
  });
  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWeight;
  final FontStyle? textFontStyle;
  final double? textHeight;
  final TextAlign? textAlign;
  final bool? isTextOverflow;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? letterSpacing;
  final String? fontfamily;

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.textAlign,
      style: TextStyle(
          // height: widget.textHeight,
          fontFamily: "NewAmsterdam" ?? "",
          fontSize: widget.textSize ?? 11,
          letterSpacing: widget.letterSpacing,
          color: widget.textColor ?? Colors.black,
          fontWeight: widget.textWeight ?? FontWeight.w500,
          fontStyle: widget.textFontStyle,
          overflow:
              (widget.isTextOverflow ?? true) ? TextOverflow.ellipsis : null),
    );
  }
}