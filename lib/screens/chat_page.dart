import 'package:chatbot/utils/chat_model.dart';
import 'package:chatbot/widget/build_chat_send_widget.dart';
import 'package:chatbot/widget/build_circle_button_widget.dart';
import 'package:chatbot/widget/build_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:lottie/lottie.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController scrollController = ScrollController();
  final gemini = Gemini.instance;
  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  final List<ChatModel> chats = [];

  void scrollDown() {
    if (scrollController.hasClients) {
      final position = scrollController.position.maxScrollExtent;
      scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 10),
        curve: Curves.linear,
      );
    }
  }

  void geminiService({
    required String messageContent,
    required bool isUser,
  }) {
    setState(() {
      chats.add(ChatModel(messageContent: messageContent, isUser: isUser));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.2,
          image: NetworkImage(
              "https://i0.wp.com/wallpapers.com/images/hd/metallic-black-abstract-94vp19xngi9d5xo5.jpg?ssl=1"),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 40),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildCircleButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Column(
                    children: [
                      BuildTextWidget(
                        text: "Chat Bot",
                        weight: FontWeight.bold,
                        size: 17,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Color(0xff6ffc03),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          BuildTextWidget(
                            text: "Online",
                            size: 13,
                          ),
                        ],
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0bkaC4dh7PFn_F-DCv41ezkMuuGtMbUKCeQ&s",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: chats.isEmpty
              ? const Center(child: BuildTextWidget(text: "Ask me anything.."))
              : SingleChildScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: chats.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return BuildChatSendWidget(
                            text: chats[index].messageContent,
                            isUser: chats[index].isUser,
                          );
                        },
                      ),
                      if (isLoading == true)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Lottie.asset(
                            'assets/images/wave.json',
                            frameRate: const FrameRate(120),
                            width: 50,
                          ),
                        ),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomAppBar(
              height: 70,
              color: const Color(0xff2a343d),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white38,
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.white38),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    iconSize: 25,
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      final searchedText = controller.text;
                      if (searchedText.isNotEmpty) {
                        geminiService(messageContent: searchedText, isUser: true);
                        scrollDown();
                        controller.clear();
                        isLoading = true;

                        gemini.chat([
                          Content(parts: [Parts(text: searchedText)], role: 'user'),
                        ]).then((value) {
                          geminiService(messageContent: value!.output!, isUser: false);

                          isLoading = false;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
