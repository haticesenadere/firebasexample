import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasexample/models/message.dart';

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final User user;

  MessageBubble({required this.message, required this.user});

  BorderRadiusGeometry _getBorderRadius() {
    return BorderRadius.only(
      topLeft: const Radius.circular(8),
      topRight: const Radius.circular(5),
      bottomLeft:
          message.userID == user.uid ? const Radius.circular(15) : Radius.zero,
      bottomRight:
          message.userID == user.uid ? Radius.zero : const Radius.circular(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isUserMessage = message.userID == user.uid;
    final backgroundColor = isUserMessage
        ? const Color.fromARGB(255, 163, 255, 182)
        : const Color.fromARGB(255, 152, 15, 15);
    final borderRadius = _getBorderRadius();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              message.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
