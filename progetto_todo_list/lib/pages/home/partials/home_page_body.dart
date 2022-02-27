import 'package:flutter/material.dart';

import '../../../components/note.dart';

class HomePageBody extends StatelessWidget {
  final List<String> notes;
  final void Function(String note) onDeleteNote;

  HomePageBody({required this.notes, required this.onDeleteNote});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Agenda",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: notes
                    .map((note) =>
                        Note(text: note, onDoubleTap: () => onDeleteNote(note)))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
