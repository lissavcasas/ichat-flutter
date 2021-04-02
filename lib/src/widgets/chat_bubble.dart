import 'package:chat_app/src/core/styles.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String author;
  final bool isMe;

  const ChatBubble({
    Key key,
    this.text,
    this.author,
    this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.80,
          ),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              color: isMe ? Styles.primary : Color(0XFFF5F6F8),
              borderRadius: BorderRadius.only(
                topLeft: isMe ? Radius.circular(20) : Radius.zero,
                topRight: isMe ? Radius.zero : Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Text(
            text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black54,
            ),
          ),
        ),
        isMe
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Styles.primary,
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://icon-library.com/images/profile-icon-white/profile-icon-white-7.jpg'),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Styles.primary,
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://icon-library.com/images/profile-icon-white/profile-icon-white-7.jpg'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
