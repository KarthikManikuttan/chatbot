import 'package:flutter/material.dart';

class BuildCircleButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final double? iconSize;
  final IconData? icon;
  const BuildCircleButtonWidget({
    super.key,
    required this.onPressed,
    this.iconSize,
    this.icon,
  });

  @override
  State<BuildCircleButtonWidget> createState() => _BuildCircleButtonWidgetState();
}

class _BuildCircleButtonWidgetState extends State<BuildCircleButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white.withOpacity(0.2),
      child: Center(
        child: IconButton(
          iconSize: widget.iconSize ?? 25,
          onPressed: widget.onPressed,
          icon: Icon(
            widget.icon ?? Icons.chevron_left,
            size: widget.iconSize ?? 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
