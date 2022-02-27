import 'package:flutter/material.dart';
import 'package:progetto_3/component/custom_component.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progetto 3"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomComponent(6, "Forza"),
          CustomComponent(2, "Agilità"),
          CustomComponent(0, "Mana"),
        ],
      ),
    );
  }
}
