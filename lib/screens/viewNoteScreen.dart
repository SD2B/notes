import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Model/noteModel.dart';
import 'package:notes_app/screens/editNoteScreen.dart';
import 'package:notes_app/service/noteProvider.dart';
import 'package:provider/provider.dart';

class ViewNoteScreen extends StatelessWidget {
  final NoteModel note;

  ViewNoteScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${DateFormat('yyyy-MM-dd HH:mm:ss').format(note.timestamp)}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 1.3,
              child: SingleChildScrollView(
                child: Text(
                  note.content,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
