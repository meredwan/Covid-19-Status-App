import 'dart:async';

import 'package:covid_status/World_States.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 50), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 100),
        () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const WorldStates()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              child: Container(
                height: 200,
                width: 200,
                child: Center(
                    child: Image.network(
                        "https://images.squarespace-cdn.com/content/v1/5e1a8289c429c302ddea1459/1591976202820-HCF9QFKRXKZ1T8WMQY8V/Virus+simplified.png")),
              ),
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Covid-19\nTracker App",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
