import 'package:flutter/material.dart';
import 'package:flutter_chat/constants/chat_colors.dart';
import 'package:flutter_chat/extensions/widget_extension.dart';
import 'package:gap/gap.dart';

class ChatAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required String title,
    required bool showBackButton,
    this.icon,
  })  : _title = title,
        _showBackButton = showBackButton,
        preferredSize = const Size.fromHeight(70);
  final String _title;
  final Widget? icon;
  final bool _showBackButton;

  @override
  final Size preferredSize;
  @override
  State<ChatAppBar> createState() => _ChatAppBarState();
}

class _ChatAppBarState extends State<ChatAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: widget._showBackButton,
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        const Gap(10),
        Visibility(
          visible: widget.icon != null,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ChatColors.pink500,
            ),
            child: Center(
              child: widget.icon,
            ),
          ),
        ),
        const Gap(10),
        Text(widget._title)
      ],
    ).addPadding(const EdgeInsets.only(
      top: 80,
      left: 15,
      right: 15,
    ));
  }
}
