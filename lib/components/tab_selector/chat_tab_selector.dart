import 'package:flutter/material.dart';
import 'package:flutter_chat/extensions/widget_extension.dart';

import '../../constants/chat_colors.dart';

class ChatTabSelector extends StatefulWidget {
  final String title;
  final bool isSelected;
  const ChatTabSelector({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  State<ChatTabSelector> createState() => _ChatTabSelectorState();
}

class _ChatTabSelectorState extends State<ChatTabSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: widget.isSelected ? ChatColors.pink500 : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 150,
                child: Divider(
                  thickness: 2,
                  color: ChatColors.pink500,
                ),
              ),
              Expanded(
                child: Divider(
                  color: ChatColors.black300.withOpacity(0.2),
                ),
              ),
            ],
          )
        ],
      ).addPadding(const EdgeInsets.only(top: 30, left: 15)),
    );
  }
}
