import 'package:chat_app/src/core/styles.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String author;

  const ChatBubble({
    Key key,
    this.text,
    this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.80,
          ),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: Styles.primary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(author),
            CircleAvatar(
              backgroundColor: Styles.primary,
              radius: 12,
              backgroundImage: NetworkImage(
                  'https://icon-library.com/images/profile-icon-white/profile-icon-white-7.jpg'),
            ),
          ],
        ),
      ],
    );
  }
}
