import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/message_response_entity.dart';

Future<List<MessageResponseEntity>> messageDataSource() async {
  try {
    // Load JSON data from the assets folder
    String data = await rootBundle.loadString('assets/messages.json');
    List<dynamic> jsonList = json.decode(data);

    // Convert JSON data to List<MessageResponseEntity>
    List<MessageResponseEntity> messages = jsonList
        .map((dynamic json) =>
            MessageResponseEntity.fromJson(json as Map<String, dynamic>))
        .toList();

    return messages;
  } catch (e) {
    print("Error loading messages: $e");
    return [];
  }
}
