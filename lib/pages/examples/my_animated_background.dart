
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

// MyAnimatedBackground class is stateful class.
class MyAnimatedBackground extends StatefulWidget {
  MyAnimatedBackground({Key? key}) : super(key: key);

  @override
  State<MyAnimatedBackground> createState() => _MyAnimatedBackgroundState();
}

class _MyAnimatedBackgroundState extends State<MyAnimatedBackground> with SingleTickerProviderStateMixin {
  // definition of ParticlesOptions.
  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.orange,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  @override
  Widget build(BuildContext context) {
    // return MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Background"),
        ),
        // In body we have a AnimatedBackgound,
        // behavior RandomParticleBehaviour.
        body: Container(
          height: 300,
          width: double.maxFinite,
          child: AnimatedBackground(
            // vsync uses singleTicketProvider state mixin.
            vsync: this,
            behaviour: RandomParticleBehaviour(options: particles,),
            child: Center(
                child: Text(
                  // center text
                  "Hello this is Random Animated Background",
                  style: TextStyle(fontSize: 50),
                )),
          ),
        ),
      ),
    );
  }
}