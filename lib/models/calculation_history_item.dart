// lib/models/calculation_history_item.dart

class CalculationHistoryItem {
  final String inputSideName; // "A", "B", or "C"
  final double inputValue;
  final double sideA;
  final double sideB;
  final double sideC;
  final double area;
  final double perimeter;
  final DateTime timestamp;

  CalculationHistoryItem({
    required this.inputSideName,
    required this.inputValue,
    required this.sideA,
    required this.sideB,
    required this.sideC,
    required this.area,
    required this.perimeter,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'inputSideName': inputSideName,
      'inputValue': inputValue,
      'sideA': sideA,
      'sideB': sideB,
      'sideC': sideC,
      'area': area,
      'perimeter': perimeter,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory CalculationHistoryItem.fromJson(Map<String, dynamic> json) {
    return CalculationHistoryItem(
      inputSideName: json['inputSideName'],
      inputValue: (json['inputValue'] as num).toDouble(),
      sideA: (json['sideA'] as num).toDouble(),
      sideB: (json['sideB'] as num).toDouble(),
      sideC: (json['sideC'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
      perimeter: (json['perimeter'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Для удобного отображения в текстовом виде (можно кастомизировать)
  @override
  String toString() {
    return 'Вход: $inputSideName = ${inputValue.toStringAsFixed(2)}\n'
        'A: ${sideA.toStringAsFixed(2)}, B: ${sideB.toStringAsFixed(2)}, C: ${sideC.toStringAsFixed(2)}\n'
        'S: ${area.toStringAsFixed(2)}, P: ${perimeter.toStringAsFixed(2)}\n'
        'Время: ${timestamp.toLocal()}';
  }
}