import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(PendulumApp());

class PendulumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PendulumScreen(),
    );
  }
}

class PendulumScreen extends StatefulWidget {
  const PendulumScreen({super.key});

  @override
  _PendulumScreenState createState() => _PendulumScreenState();
}

class _PendulumScreenState extends State<PendulumScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double _length = 200; // Length of the pendulum
  final double _bobRadius = 20; // Radius of the pendulum bob
  final double _maxAngle = pi / 4; // Maximum swing angle (45 degrees)

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -_maxAngle, end: _maxAngle).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendulum Simulation'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: PendulumPainter(
                angle: _animation.value,
                length: _length,
                bobRadius: _bobRadius,
              ),
              child: SizedBox(
                width: 400,
                height: 400,
              ),
            );
          },
        ),
      ),
    );
  }
}

class PendulumPainter extends CustomPainter {
  final double angle;
  final double length;
  final double bobRadius;

  PendulumPainter({
    required this.angle,
    required this.length,
    required this.bobRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 4;

    final bobX = centerX + length * sin(angle);
    final bobY = centerY + length * cos(angle);

    final pendulumLine = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final bobPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Draw pendulum arm
    canvas.drawLine(Offset(centerX, centerY), Offset(bobX, bobY), pendulumLine);

    // Draw pendulum bob
    canvas.drawCircle(Offset(bobX, bobY), bobRadius, bobPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
