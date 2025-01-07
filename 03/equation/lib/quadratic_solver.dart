import 'dart:ffi';
import 'dart:io';

typedef SolveQuadraticNative = Pointer<Double> Function(
    Double a, Double b, Double c);
typedef SolveQuadraticDart = Pointer<Double> Function(
    double a, double b, double c);

class QuadraticSolver {
  late DynamicLibrary _library;
  late SolveQuadraticDart _solveQuadratic;

  QuadraticSolver() {
    // Load the shared library
    _library = Platform.isAndroid
        ? DynamicLibrary.open("libsolve_equation.so")
        : Platform.isWindows
        ? DynamicLibrary.open("solve_equation.dll")
        : DynamicLibrary.process();

    _solveQuadratic = _library
        .lookup<NativeFunction<SolveQuadraticNative>>('solveQuadratic')
        .asFunction();
  }

  List<double> solve(double a, double b, double c) {
    final Pointer<Double> result = _solveQuadratic(a, b, c);
    final numRoots = result[0];
    if (numRoots == -1) {
      throw Exception("Invalid quadratic equation.");
    }

    return List.generate(numRoots.toInt() + 1, (i) => result[i]);
  }
}
