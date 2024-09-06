import 'package:chatbot/widget/build_text_widget.dart';
import 'package:flutter/material.dart';

class BuildChatSendWidget extends StatefulWidget {
  final String text;
  final bool isUser;

  const BuildChatSendWidget({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  State<BuildChatSendWidget> createState() => _BuildChatSendWidgetState();
}

class _BuildChatSendWidgetState extends State<BuildChatSendWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: widget.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.8),
            decoration: BoxDecoration(
              gradient: widget.isUser
                  ? const LinearGradient(
                      colors: [Color(0xff6a3093), Color(0xffa044ff)],
                      stops: [0, 1],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : const LinearGradient(
                      colors: [Color(0xff16222a), Color(0xff3a6073)],
                      stops: [0, 1],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
              borderRadius: widget.isUser
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(3),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(20),
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: BuildTextWidget(
                text: widget.text,
                align: widget.isUser ? TextAlign.right : TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
