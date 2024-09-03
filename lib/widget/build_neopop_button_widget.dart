import 'package:chatbot/widget/build_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class BuildNeopopButtonWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback onTapUp;
  final double? size;
  final FontWeight? weight;
  const BuildNeopopButtonWidget({
    super.key,
    required this.text,
    this.color,
    required this.onTapUp,
    this.size,
    this.weight,
    this.textColor,
  });

  @override
  State<BuildNeopopButtonWidget> createState() => _BuildNeopopButtonWidgetState();
}

class _BuildNeopopButtonWidgetState extends State<BuildNeopopButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      depth: 5,
      color: widget.color ?? Colors.white,
      onTapUp: widget.onTapUp,
      bottomShadowColor: Colors.grey,
      rightShadowColor: Colors.grey,
      child: Center(
        child: NeoPopShimmer(
          shimmerColor: Colors.grey[300]!,
          shimmerWidth: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 10),
            child: BuildTextWidget(
                text: widget.text,
                color: widget.textColor ?? Colors.black,
                size: widget.size ?? 15,
                weight: widget.weight ?? FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
