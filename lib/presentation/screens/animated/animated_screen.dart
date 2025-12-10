import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    //double opacity = random.nextDouble();
    double opacity = 1;
    color = Color.fromRGBO(r, g, b, opacity);
    borderRadius = random.nextInt(100) + 20 ;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0: height,
          decoration: BoxDecoration(
            color: color, 
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: changeShape, child: Icon(Icons.play_arrow_rounded)),
    );
  }
}
