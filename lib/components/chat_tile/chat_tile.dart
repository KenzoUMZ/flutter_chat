import 'package:flutter/material.dart';

import '../../constants/chat_colors.dart';
import '../../extensions/widget_extension.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.lastMessage,
    required this.date,
    required this.unreadMessages,
  });
  final String imageUrl;
  final String title;
  final String lastMessage;
  final String date;
  final int unreadMessages;
  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(widget.imageUrl),
      ),
      title: Text(
        widget.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.lastMessage,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ChatColors.pink500,
            ),
            child: Center(
              child: Text(
                widget.unreadMessages.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ).addPadding(const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 5,
    ));
  }
}
