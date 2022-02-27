import 'package:flutter/material.dart';
import 'package:progetto_todo_list/pages/home/partials/home_page_body.dart';
import 'package:progetto_todo_list/pages/home/partials/home_page_sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];

  void addNewNote() {
    var note = [
      "Fare benzina",
      "Pulire l'auto",
      "Iscrizione Palestra",
      "Comprare il pane",
      "Leggere Il signore degli anelli",
      "Comprare verdura",
      "Appuntamento Barber"
    ];

    var randomItem = (note..shuffle()).first;

    setState(() {
      notes.add(randomItem.toString());
    });
  }

  void onDeleteNote(String note) {
    setState(() {
      notes.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            HomePageSidebar(addNewNote: addNewNote),
            Positioned(
                left: 60,
                right: 0,
                top: 0,
                bottom: 0,
                child: HomePageBody(notes: notes, onDeleteNote: onDeleteNote)),
          ],
        ),
      ),
    );
  }
}
