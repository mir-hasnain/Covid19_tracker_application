import 'dart:async';
import 'package:covid_tracker/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController controller = AnimationController(
    duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: MediaQuery.of(context).size.height * .2,),
          AnimatedBuilder(
              animation: controller,
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * 1,
                  child: const Image(image: AssetImage('images/virus.png',),
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child){
                return Transform.rotate(
                    angle: controller.value * 2.5 * math.pi,
                  child: child
                );
              }
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .08,),
          const Text('Covid-19 \n Tracker',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
