import 'package:flutter/material.dart';

class BuildTextWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final String? family;
  const BuildTextWidget({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.family,
  });

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color ?? Colors.white,
          fontSize: widget.size ?? 15,
          fontFamily: widget.family ?? "Denton",
          letterSpacing: 1,
          fontWeight: widget.weight ?? FontWeight.normal),
    );
  }
}
