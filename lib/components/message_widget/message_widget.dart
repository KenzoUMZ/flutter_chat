import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/chat_colors.dart';
import '../../functions/parse_date.dart';
import '../../functions/parse_time.dart';
import '../../model/message_response_entity.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.message,
    required this.isUser,
    required this.dateTime,
  });

  final MessageResponseEntity message;
  final bool isUser;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: !isUser,
          child: Text(
            message.author?.firstName ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: ChatColors.black300,
            ),
          ),
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isUser ? ChatColors.blue600 : ChatColors.black300,
            borderRadius: BorderRadius.only(
              topLeft:
                  isUser ? const Radius.circular(10) : const Radius.circular(0),
              topRight:
                  isUser ? const Radius.circular(0) : const Radius.circular(10),
              bottomLeft: const Radius.circular(10),
              bottomRight: const Radius.circular(10),
            ),
          ),
          child: Text(
            message.text ?? '',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              parseDate(date: dateTime),
              style: const TextStyle(
                fontSize: 10,
                color: ChatColors.black300,
              ),
            ),
            Gap(2),
            Container(
              height: 3,
              width: 3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ChatColors.black300,
              ),
            ),
            Gap(2),
            Text(
              parseTime(dateTime: dateTime),
              style: const TextStyle(
                fontSize: 10,
                color: ChatColors.black300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
