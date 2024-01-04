// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// [
//   {
//     "author": {
//       "firstName": "Sender",
//       "id": "1",
//       "lastName": "Lastname"
//     },
//     "createdAt": 1641388800000,
//     "id": "1",
//     "status": "sent",
//     "text": "Hello, how are you?",
//     "type": "text",
//     "date": "2022-01-05T08:00:00Z"
//   },
//   {
//     "author": {
//       "firstName": "Receiver",
//       "id": "2",
//       "lastName": "LastName"
//     },
//     "createdAt": 1641392400000,
//     "id": "2",
//     "status": "received",
//     "text": "Hi! I'm doing well, thank you. How about you?",
//     "type": "text",
//     "date": "2022-01-05T09:00:00Z"
//   },
//   {
//     "author": {
//       "firstName": "Sender",
//       "id": "1",
//       "lastName": "Lastname"
//     },
//     "createdAt": 1641396000000,
//     "id": "3",
//     "status": "sent",
//     "text": "I'm good too. Just working on some Flutter code.",
//     "type": "text",
//     "date": "2022-01-05T10:00:00Z"
//   },
//   {
//     "author": {
//       "firstName": "Receiver",
//       "id": "2",
//       "lastName": "LastName"
//     },
//     "createdAt": 1641399600000,
//     "id": "4",
//     "status": "received",
//     "text": "That's great! Flutter is awesome. Anything specific you're working on?",
//     "type": "text",
//     "date": "2022-01-05T11:00:00Z"
//   },
//   {
//     "author": {
//       "firstName": "Sender",
//       "id": "1",
//       "lastName": "Lastname"
//     },
//     "createdAt": 1641403200000,
//     "id": "5",
//     "status": "sent",
//     "text": "I'm building a chat app, actually!",
//     "type": "text",
//     "date": "2022-01-05T12:00:00Z"
//   },
//   {
//     "author": {
//       "firstName": "Receiver",
//       "id": "2",
//       "lastName": "LastName"
//     },
//     "createdAt": 1641406800000,
//     "id": "6",
//     "status": "received",
//     "text": "That sounds cool! Flutter makes it easy. Good luck with your project!",
//     "type": "text",
//     "date": "2022-01-05T13:00:00Z"
//   }
// ]

class MessageResponseEntity {
  final Author? author;
  final int? createdAt;
  final String? id;
  final String? status;
  final String? text;
  final String? type;
  final DateTime? date;
  MessageResponseEntity({
    this.author,
    this.createdAt,
    this.id,
    this.status,
    this.text,
    this.type,
    this.date,
  });

  MessageResponseEntity copyWith({
    Author? author,
    int? createdAt,
    String? id,
    String? status,
    String? text,
    String? type,
    DateTime? date,
  }) {
    return MessageResponseEntity(
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      status: status ?? this.status,
      text: text ?? this.text,
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author?.toMap(),
      'createdAt': createdAt,
      'id': id,
      'status': status,
      'text': text,
      'type': type,
      'date': date?.millisecondsSinceEpoch,
    };
  }

  factory MessageResponseEntity.fromJson(Map<String, dynamic> json) =>
      MessageResponseEntity(
        author: json['author'] == null
            ? null
            : Author.fromMap(json['author'] as Map<String, dynamic>),
        createdAt: json['createdAt'] as int?,
        id: json['id'] as String?,
        status: json['status'] as String?,
        text: json['text'] as String?,
        type: json['type'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
      );

  @override
  String toString() {
    return 'MessageResponseEntity(author: $author, createdAt: $createdAt, id: $id, status: $status, text: $text, type: $type, date: $date)';
  }

  @override
  bool operator ==(covariant MessageResponseEntity other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.createdAt == createdAt &&
        other.id == id &&
        other.status == status &&
        other.text == text &&
        other.type == type &&
        other.date == date;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        createdAt.hashCode ^
        id.hashCode ^
        status.hashCode ^
        text.hashCode ^
        type.hashCode ^
        date.hashCode;
  }
}

class Author {
  String firstName;
  String id;
  String lastName;

  Author({
    required this.firstName,
    required this.id,
    required this.lastName,
  });

  Author copyWith({
    String? firstName,
    String? id,
    String? lastName,
  }) {
    return Author(
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'id': id,
      'lastName': lastName,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      firstName: map['firstName'] as String,
      id: map['id'] as String,
      lastName: map['lastName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) =>
      Author.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Author(firstName: $firstName, id: $id, lastName: $lastName)';

  @override
  bool operator ==(covariant Author other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.id == id &&
        other.lastName == lastName;
  }

  @override
  int get hashCode => firstName.hashCode ^ id.hashCode ^ lastName.hashCode;
}
