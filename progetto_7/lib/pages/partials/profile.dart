import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 380,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
              )
            ]),
        child: Stack(children: [
          backgroundImage(),
          content(),
        ]),
      ),
    );
  }

  Widget backgroundImage() => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Image.network(
          "https://images.unsplash.com/photo-1643101451925-1268efaec21a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80",
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      );

  Widget content() => Positioned(
        top: 160,
        bottom: 0,
        left: 0,
        right: 0,
        child: Column(
          children: [
            CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://media-exp1.licdn.com/dms/image/C5603AQFTWxo5wSu_ZQ/profile-displayphoto-shrink_800_800/0/1574768857971?e=1652313600&v=beta&t=r52UUiDDMb8iTB1OAPbPzh8agIbp_lyOu399ApvZCo8"),
                radius: 40),
            SizedBox(
              height: 20,
            ),
            Text(
              "Bryan Calderoni",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Developer"),
            SizedBox(
              height: 20,
            ),
            Text(
              "NFT Collector",
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ),
      );
}
