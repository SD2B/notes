import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/Model/noteModel.dart';
import 'package:notesapp/screens/editNoteScreen.dart';
import 'package:notesapp/service/noteProvider.dart';
import 'package:provider/provider.dart';

class ViewNoteScreen extends StatelessWidget {
  final NoteModel note;

  ViewNoteScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Note'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  note.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.yellow),
                ),
              ),
              Center(
                child: Text(
                  'Timestamp: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(note.timestamp)}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              Text(
                note.content,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
