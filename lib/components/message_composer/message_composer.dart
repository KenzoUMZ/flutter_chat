import 'package:flutter/material.dart';
import 'package:flutter_chat/constants/chat_colors.dart';

class MessageComposer extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onSubmitted;

  const MessageComposer({
    super.key,
    required this.textController,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: ChatColors.black300,
              ),
              color: ChatColors.neutral100,
            ),
            child: TextField(
              controller: textController,
              decoration:
                  const InputDecoration.collapsed(hintText: 'Type a message'),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ChatColors.pink500,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (textController.text.isNotEmpty) {
                    onSubmitted(textController.text);
                    textController.clear(); // Clear the text after sending
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
