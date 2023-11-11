import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String id;
  final String title;
  final String content;
  final DateTime timestamp;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  factory NoteModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    Timestamp timestamp = data['timestamp'] as Timestamp;
    DateTime noteTimestamp = timestamp != null ? timestamp.toDate() : DateTime.now();

    return NoteModel(
      id: snapshot.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      timestamp: noteTimestamp,
    );
  }

}
