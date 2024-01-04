// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatResponseEntity {
  final String? chatId;
  final String? chatPictureUrl;
  final String? chatName;
  final String? lastMessage;
  final int? unreadMessages;
  final DateTime? lastMessageDate;
  ChatResponseEntity({
    this.chatId,
    this.chatPictureUrl,
    this.chatName,
    this.lastMessage,
    this.unreadMessages,
    this.lastMessageDate,
  });

  ChatResponseEntity copyWith({
    String? chatId,
    String? chatPictureUrl,
    String? chatName,
    String? lastMessage,
    int? unreadMessages,
    DateTime? lastMessageDate,
  }) {
    return ChatResponseEntity(
      chatId: chatId ?? this.chatId,
      chatPictureUrl: chatPictureUrl ?? this.chatPictureUrl,
      chatName: chatName ?? this.chatName,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadMessages: unreadMessages ?? this.unreadMessages,
      lastMessageDate: lastMessageDate ?? this.lastMessageDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatId': chatId,
      'chatPictureUrl': chatPictureUrl,
      'chatName': chatName,
      'lastMessage': lastMessage,
      'unreadMessages': unreadMessages,
      'lastMessageDate': lastMessageDate?.millisecondsSinceEpoch,
    };
  }

  factory ChatResponseEntity.fromJson(Map<String, dynamic> json) =>
      ChatResponseEntity(
        chatId: json['chatId'] as String?,
        chatPictureUrl: json['chatPictureUrl'] as String?,
        chatName: json['chatName'] as String?,
        lastMessage: json['lastMessage'] as String?,
        unreadMessages: json['unreadMessages'] as int?,
        lastMessageDate: json['lastMessageDate'] == null
            ? null
            : DateTime.parse(json['lastMessageDate']),
      );

  @override
  String toString() {
    return 'ChatResponseEntity(chatId: $chatId, chatPictureUrl: $chatPictureUrl, chatName: $chatName, lastMessage: $lastMessage, unreadMessages: $unreadMessages, lastMessageDate: $lastMessageDate)';
  }

  @override
  bool operator ==(covariant ChatResponseEntity other) {
    if (identical(this, other)) return true;

    return other.chatId == chatId &&
        other.chatPictureUrl == chatPictureUrl &&
        other.chatName == chatName &&
        other.lastMessage == lastMessage &&
        other.unreadMessages == unreadMessages &&
        other.lastMessageDate == lastMessageDate;
  }

  @override
  int get hashCode {
    return chatId.hashCode ^
        chatPictureUrl.hashCode ^
        chatName.hashCode ^
        lastMessage.hashCode ^
        unreadMessages.hashCode ^
        lastMessageDate.hashCode;
  }
}
