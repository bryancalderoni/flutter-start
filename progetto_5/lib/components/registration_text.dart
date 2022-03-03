import 'package:flutter/material.dart';

class RegistrationText extends StatelessWidget {
  final Widget child;
  final String title;
  const RegistrationText({required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
                color: Colors.grey.shade600, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        child,
        SizedBox(
          height: 10,
        ),
        Divider(),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
