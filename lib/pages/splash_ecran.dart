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
    Future.delayed(const Duration(seconds: 3), () async {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BarNavigare(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFCF596),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              // Animation for the text
              TweenAnimationBuilder(
                tween: Tween<double>(begin: -500.0, end: 0.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                builder: (context, double value, child) {
                  return Transform.translate(
                    offset: Offset(value, 0), // Animate horizontal position
                    child: const Text(
                      "W E L C O M E  T O  T H E  ",
                      style: TextStyle(
                        color: Color(0xff85790E),
                        fontFamily: "Italia",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'images/The_Star_Logo.png', // Replace with your actual image path
                  width: 200, // Adjust size as needed
                  height: 200, // Adjust size as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
