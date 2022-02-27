import 'package:flutter/material.dart';

class CustomComponent extends StatefulWidget {
  int value;
  String label;

  CustomComponent(this.value, this.label);

  @override
  _CustomComponentState createState() => _CustomComponentState();
}

class _CustomComponentState extends State<CustomComponent> {
  late int value;
  late String label;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  void incrementValue() {
    setState(() {
      value += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        value.toString(),
        style: TextStyle(color: Colors.blue, fontSize: 22),
      ),
      title: Text(
        widget.label,
        style: TextStyle(color: Colors.blue),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          incrementValue();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
