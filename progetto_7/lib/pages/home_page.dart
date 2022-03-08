import 'package:flutter/material.dart';
import 'package:progetto_7/pages/partials/home.dart';
import 'package:progetto_7/pages/partials/profile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("NFT shop"),
          centerTitle: true,
          bottom: TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              icon: Icon(Icons.home_outlined),
            ),
            Tab(
              icon: Icon(Icons.person_outline),
            )
          ]),
        ),
        body: TabBarView(children: [
          Home(),
          Profile(),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {},
          label: Text("Vendi NFT"),
          icon: Icon(Icons.attach_money),
        ),
      ),
    );
  }
}
