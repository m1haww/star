import 'package:flutter/material.dart';
import 'package:star/models/bar_navigare.dart';

class SplashEcran extends StatefulWidget {
  const SplashEcran({super.key});

  @override
  State<SplashEcran> createState() => _SplashEcranState();
}

class _SplashEcranState extends State<SplashEcran> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async {
      if (mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BarNavigare(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFCF596),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  "W E L C O M E  T O  T H E  ",
                  style: TextStyle(
                      color: Color(0xff85790E),
                      fontFamily: "Italia",
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "S T A R",
                style: TextStyle(
                    color: Color(0xffC4B319),
                    fontFamily: "Italia",
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
