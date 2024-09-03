import 'package:chatbot/screens/chat_page.dart';
import 'package:chatbot/widget/build_neopop_button_widget.dart';
import 'package:chatbot/widget/build_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/bg_video.mp4")
      ..initialize().then((_) {
        _controller?.play();
        _controller?.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: 400,
                height: 700,
                child: Opacity(
                  opacity: 0.6,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, -0.3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: BuildTextWidget(
                    text: "Hey Buddy👋",
                    color: Colors.white,
                    size: 14,
                    family: "sans",
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, -0.15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: BuildTextWidget(
                    text: "How may I help you today",
                    color: Colors.white,
                    size: 14,
                    family: "sans",
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.7),
            child: Lottie.asset(
              'assets/images/wave.json',
              frameRate: const FrameRate(120),
              width: 90,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: SizedBox(
              width: 300,
              height: 50,
              child: BuildNeopopButtonWidget(
                text: "Tap to Chat",
                onTapUp: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatPage(),
                    ),
                  );
                },
                color: Colors.white,
                size: 20,
                weight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
