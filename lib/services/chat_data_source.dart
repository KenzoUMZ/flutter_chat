import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/chat_response_entity.dart';

Future<List<ChatResponseEntity>> chatDataSource() async {
  try {
    // Load JSON data from the assets folder
    String data = await rootBundle.loadString('assets/chats.json');
    List<dynamic> jsonList = json.decode(data);

    // Convert JSON data to List<MessageResponseEntity>
    List<ChatResponseEntity> chats = jsonList
        .map((dynamic json) => ChatResponseEntity.fromJson(json as Map<String, dynamic>))
        .toList();

    return chats;
  } catch (e) {
    print("Error loading messages: $e");
    return [];
  }
}
