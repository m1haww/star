import 'package:flutter/material.dart';

class GlavanaiaPage extends StatefulWidget {
  @override
  State<GlavanaiaPage> createState() => _GlavanaiaPageState();
}

class _GlavanaiaPageState extends State<GlavanaiaPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFFF8E6),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reminders",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: "Js",
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Pinned",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Js",
                  fontSize: 19,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(""),
          ],
        ),
      )),
    );
  }
}
