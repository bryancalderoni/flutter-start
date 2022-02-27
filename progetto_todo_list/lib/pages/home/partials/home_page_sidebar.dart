import 'package:flutter/material.dart';

class HomePageSidebar extends StatelessWidget {
  final Function() addNewNote;
  HomePageSidebar({required this.addNewNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage("assets/Avatar.png"),
              ),
              IconButton(
                onPressed: () {
                  addNewNote();
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
              )
            ]),
      ),
    );
  }
}
