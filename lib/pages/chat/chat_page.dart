import 'package:flutter/material.dart';
import 'package:flutter_chat/constants/images.dart';
import 'package:flutter_chat/extensions/widget_extension.dart';
import 'package:flutter_chat/services/message_data_source.dart';

import '../../components/message_composer/message_composer.dart';
import '../../components/message_widget/message_widget.dart';
import '../../model/message_response_entity.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<MessageResponseEntity> messages;
  late TextEditingController _messageController;
  final String currentUser = 'Sender';
  @override
  void initState() {
    super.initState();

    _messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Images.backgroundPatternChat.image,
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FutureBuilder<List<MessageResponseEntity>>(
              future: messageDataSource(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  messages = snapshot.data!;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      MessageResponseEntity message = messages[index];
                      return MessageWidget(
                        message: message,
                        isUser: message.author?.firstName == 'Sender',
                        dateTime: message.date ?? DateTime.now(),
                      ).addPadding(
                        const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error loading messages');
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MessageComposer(
              onSubmitted: (String value) {
                setState(() {
                  messages.add(
                    MessageResponseEntity(
                      author:
                          Author(id: '1', firstName: currentUser, lastName: ''),
                      text: value,
                    ),
                  );
                });
              },
              textController: _messageController,
            ),
          ).addPadding(const EdgeInsets.only(bottom: 15))
        ],
      ),
    );
  }
}
