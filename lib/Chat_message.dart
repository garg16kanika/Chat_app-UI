import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatMessage extends StatelessWidget {
  final String name = 'Kanika';
  final String sentMessage;

  ChatMessage(this.sentMessage);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Flexible(
            child: CircleAvatar(
              backgroundColor: Colors.purple,
              child: Text(name[0]),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(sentMessage),
            ],
          )
        ],
      ),
    );
  }
}
