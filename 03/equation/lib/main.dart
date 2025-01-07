import 'package:flutter/material.dart';
import 'quadratic_solver.dart';

void main() => runApp(QuadraticApp());

class QuadraticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuadraticSolverScreen(),
    );
  }
}

class QuadraticSolverScreen extends StatefulWidget {
  @override
  _QuadraticSolverScreenState createState() => _QuadraticSolverScreenState();
}

class _QuadraticSolverScreenState extends State<QuadraticSolverScreen> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _cController = TextEditingController();
  final _solver = QuadraticSolver();

  String _result = "";

  void _solveEquation() {
    final double a = double.tryParse(_aController.text) ?? 0;
    final double b = double.tryParse(_bController.text) ?? 0;
    final double c = double.tryParse(_cController.text) ?? 0;

    try {
      final roots = _solver.solve(a, b, c);
      setState(() {
        if (roots.length == 1) {
          _result = "No real roots.";
        } else if (roots.length == 2) {
          _result = "One root: x = ${roots[1]}";
        } else {
          _result = "Two roots: x1 = ${roots[1]}, x2 = ${roots[2]}";
        }
      });
    } catch (e) {
      setState(() {
        _result = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quadratic Equation Solver"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _aController,
              decoration: InputDecoration(labelText: "Enter a"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bController,
              decoration: InputDecoration(labelText: "Enter b"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _cController,
              decoration: InputDecoration(labelText: "Enter c"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _solveEquation,
              child: Text("Solve"),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
