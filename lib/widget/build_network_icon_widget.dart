import 'package:flutter/material.dart';

class BuildNetworkIconWidget extends StatefulWidget {
  final String imgLink;
  final double? size;
  const BuildNetworkIconWidget({super.key, required this.imgLink, this.size});

  @override
  State<BuildNetworkIconWidget> createState() => _BuildNetworkIconWidgetState();
}

class _BuildNetworkIconWidgetState extends State<BuildNetworkIconWidget> {
  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      NetworkImage(widget.imgLink),
      color: Colors.white,
      size: widget.size ?? 20,
    );
  }
}
