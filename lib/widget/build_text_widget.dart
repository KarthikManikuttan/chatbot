import 'package:flutter/material.dart';

class BuildTextWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final double? size;
  final double? letterSpacing;
  final FontWeight? weight;
  final String? family;
  final TextAlign? align;
  const BuildTextWidget({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.family,
    this.letterSpacing,
    this.align,
  });

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: widget.align,
      style: TextStyle(
          color: widget.color ?? Colors.white,
          fontSize: widget.size ?? 15,
          fontFamily: widget.family ?? "Roboto",
          letterSpacing: widget.letterSpacing ?? 0,
          fontWeight: widget.weight ?? FontWeight.normal),
    );
  }
}
