import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void showEmailDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
                child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inserisci la tua Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  TextField(
                    minLines: 3,
                    maxLines: 10,
                    decoration: InputDecoration(
                        hintText: "Messaggio", border: InputBorder.none),
                  ),
                  Divider(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Invia"),
                    ),
                  )
                ],
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.mail),
        label: Text("Email"),
        onPressed: () => showEmailDialog(context),
      ),
    );
  }
}
