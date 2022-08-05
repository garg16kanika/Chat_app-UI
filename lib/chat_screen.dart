import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './Chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  List<ChatMessage> messages = [];

  void sendMessage(String text) {
    controller.clear();
    ChatMessage message = ChatMessage(text);

    setState(() {
      messages.insert(0, message);
    });
  }

  Widget TextComposerWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            child: Flexible(
              child: TextField(
                onSubmitted: sendMessage,
                controller: controller,
                decoration:
                    InputDecoration.collapsed(hintText: 'Enter message here!'),
              ),
            ),
          ),
          IconButton(
            onPressed: () => sendMessage(controller.text),
            icon: Icon(
              Icons.send,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: ((context, index) => messages[index]),
          ),
        ),
        Divider(
          height: 40,
        ),
        Container(
          child: TextComposerWidget(),
        ),
      ],
    );
  }
}
