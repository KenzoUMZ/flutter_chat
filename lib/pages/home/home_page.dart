import 'package:flutter/material.dart';

import '../../components/chat_tile/chat_tile.dart';
import '../../components/tab_selector/chat_tab_selector.dart';
import '../../constants/chat_colors.dart';
import '../../extensions/widget_extension.dart';
import '../../functions/parse_date.dart';
import '../../model/chat_response_entity.dart';
import '../../services/chat_data_source.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatTabSelector(
          title: 'Conversas recentes',
          isSelected: true,
        ),
        FutureBuilder<List<ChatResponseEntity>>(
            future: chatDataSource(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                List<ChatResponseEntity> chats = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      ChatResponseEntity chat = chats[index];
                      return ChatTile(
                        imageUrl: chat.chatPictureUrl ?? '',
                        title: chat.chatName ?? '',
                        lastMessage: chat.lastMessage ?? '',
                        date: parseDate(date: chat.lastMessageDate),
                        unreadMessages: chat.unreadMessages ?? 0,
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}
