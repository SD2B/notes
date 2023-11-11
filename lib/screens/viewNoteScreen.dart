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
        title: Text(note.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Timestamp: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(note.timestamp)}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),

                child: Text(
                  note.content,
                  style: TextStyle(fontSize: 18,color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
