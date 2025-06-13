// lib/models/triangle_model.dart
import 'dart:math' as math;

class TriangleModel {
  final double sideA; // Катет, противолежащий углу 30°
  final double sideB; // Катет, противолежащий углу 60°
  final double sideC; // Гипотенуза, противолежащая углу 90°

  final double angleA = 30;
  final double angleB = 60;
  final double angleC = 90;

  TriangleModel({required this.sideA, required this.sideB, required this.sideC});

  // Расчет по стороне A
  factory TriangleModel.calculateFromA(double a) {
    if (a <= 0) throw ArgumentError("Side A must be positive");
    double b = a * math.sqrt(3);
    double c = 2 * a;
    return TriangleModel(sideA: a, sideB: b, sideC: c);
  }

  // Расчет по стороне B
  factory TriangleModel.calculateFromB(double b) {
    if (b <= 0) throw ArgumentError("Side B must be positive");
    double a = b / math.sqrt(3);
    double c = 2 * a; // или (2 * b) / math.sqrt(3)
    return TriangleModel(sideA: a, sideB: b, sideC: c);
  }

  // Расчет по стороне C
  factory TriangleModel.calculateFromC(double c) {
    if (c <= 0) throw ArgumentError("Side B must be positive");
    double a = c / 2;
    double b = a * math.sqrt(3); // или (c * math.sqrt(3)) / 2
    return TriangleModel(sideA: a, sideB: b, sideC: c);
  }

  double get area {
    // Площадь прямоугольного треугольника = 1/2 * a * b
    return (sideA * sideB) / 2;
  }

  double get perimeter {
    return sideA + sideB + sideC;
  }

  @override
  String toString() {
    return 'Triangle(A: ${sideA.toStringAsFixed(2)}, B: ${sideB.toStringAsFixed(2)}, C: ${sideC.toStringAsFixed(2)}, Area: ${area.toStringAsFixed(2)}, Perimeter: ${perimeter.toStringAsFixed(2)})';
  }
}