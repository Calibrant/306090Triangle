// lib/widgets/triangle_painter.dart
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../models/triangle_model.dart'; // Путь к вашей модели

class TrianglePainter extends CustomPainter {
  final TriangleModel triangle;
  final String?
      inputSideName; // 'A', 'B', 'C' или null, какая сторона была введена
  final double?
      inputValue; // значение введенной стороны (не используется в рисовании напрямую, но полезно для shouldRepaint)
  final Color textColor; // Добавляем параметр цвета текста
  final Color highlightColor; // Добавляем параметр цвета выделения

  TrianglePainter({
    required this.triangle,
    this.inputSideName,
    this.inputValue,
    required this.textColor, // Обязательный параметр
    required this.highlightColor, // Обязательный параметр
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors
          .blueAccent // Цвет линий треугольника, можно тоже сделать зависимым от темы
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Для темной темы линии могут быть светлее
    final Brightness brightness = ThemeData.estimateBrightnessForColor(
        textColor); // Определяем яркость фона из цвета текста
    if (brightness == Brightness.dark) {
      // Если фон темный (значит текст светлый)
      paint.color = Colors.cyan; // Светлые линии для темной темы
    }

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Масштабируем треугольник, чтобы он вписался в доступное пространство.
    // Сторона A (против 30°) будет горизонтальной основой для простоты визуализации.
    // Отношения сторон: A=x, B=x*sqrt(3), C=2x.
    // Мы хотим, чтобы сторона B (самая длинная из катетов при такой ориентации) была вертикальной.

    double displaySideALength; // Длина отрисовки для стороны A модели
    double displaySideBLength; // Длина отрисовки для стороны B модели

    // Максимальные размеры для рисования с отступами
    double drawableWidth = size.width * 0.85;
    double drawableHeight = size.height * 0.85;

    // Рассчитываем масштабный коэффициент.
    // Пусть сторона A (модели) будет по горизонтали, B (модели) по вертикали.
    // A : B = 1 : sqrt(3)
    double ratioHorizontal = triangle.sideA; // Если sideA горизонтально
    double ratioVertical = triangle.sideB; // Если sideB вертикально

    double scale;
    if (ratioHorizontal == 0 || ratioVertical == 0) {
      // Защита от деления на ноль
      scale = 1.0;
    } else if (drawableWidth / ratioHorizontal <
        drawableHeight / ratioVertical) {
      scale = drawableWidth / ratioHorizontal;
    } else {
      scale = drawableHeight / ratioVertical;
    }

    displaySideALength = triangle.sideA * scale;
    displaySideBLength = triangle.sideB * scale;

    // Защита от слишком маленького/большого масштаба, если что-то пошло не так
    if (displaySideALength < 10 || displaySideBLength < 10) {
      displaySideALength = math.max(10, displaySideALength);
      displaySideBLength = math.max(10, displaySideBLength);
    }

    // Центрируем треугольник
    double offsetX = (size.width - displaySideALength) / 2;
    double offsetY = (size.height - displaySideBLength) / 2;

    // Координаты вершин:
    // pC: Вершина прямого угла (90°)
    // pA: Вершина угла A (30°)
    // pB: Вершина угла B (60°)
    // Рисуем так, чтобы сторона A (модели) была горизонтальной, B (модели) - вертикальной.
    // Прямой угол в левом нижнем углу нашего "рисунка".

    Offset pC = Offset(offsetX, offsetY + displaySideBLength); // Прямой угол
    Offset pA = Offset(offsetX + displaySideALength,
        offsetY + displaySideBLength); // Угол 30° (конец стороны A)
    Offset pB = Offset(offsetX, offsetY); // Угол 60° (конец стороны B)

    final path = Path();
    path.moveTo(pA.dx, pA.dy); // от вершины A
    path.lineTo(pC.dx, pC.dy); // к вершине C (прямой угол)
    path.lineTo(pB.dx, pB.dy); // к вершине B
    path.close(); // замыкаем на A (гипотенуза)
    canvas.drawPath(path, paint);

    // Функция для отрисовки текста
    void drawText(String text, Offset position,
        {required Color color,
        double fontSize = 14.0,
        Alignment alignment = Alignment.center,
        FontWeight fontWeight = FontWeight.bold}) {
      textPainter.text = TextSpan(
        text: text,
        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
      );
      textPainter.layout();

      Offset textOffset = Offset.zero;
      if (alignment == Alignment.center) {
        textOffset = Offset(-textPainter.width / 2, -textPainter.height / 2);
      } else if (alignment == Alignment.centerLeft)
        textOffset = Offset(0, -textPainter.height / 2);
      else if (alignment == Alignment.centerRight)
        textOffset = Offset(-textPainter.width, -textPainter.height / 2);
      else if (alignment == Alignment.topLeft)
        textOffset = Offset.zero;
      else if (alignment == Alignment.topCenter)
        textOffset = Offset(-textPainter.width / 2, 0);
      else if (alignment == Alignment.topRight)
        textOffset = Offset(-textPainter.width, 0);
      else if (alignment == Alignment.bottomLeft)
        textOffset = Offset(0, -textPainter.height);
      else if (alignment == Alignment.bottomCenter)
        textOffset = Offset(-textPainter.width / 2, -textPainter.height);
      else if (alignment == Alignment.bottomRight)
        textOffset = Offset(-textPainter.width, -textPainter.height);

      textPainter.paint(canvas, position + textOffset);
    }

    // Color highlightColor = Colors.redAccent;
    // Color defaultColor = Colors.black87;
    double sideFontSize = 14.5;
    double angleFontSize = 16.0;

    // Подписи сторон (используем реальные значения из triangle_model)
    // Сторона A (горизонтальная, между pC и pA)
    drawText('A = ${triangle.sideA.toStringAsFixed(1)}',
        Offset((pC.dx + pA.dx) / 2, pC.dy + 15), // Под стороной A
        color: inputSideName == 'A' ? highlightColor : textColor,
        fontSize: sideFontSize);

    // Сторона B (вертикальная, между pC и pB)
    drawText('B = ${triangle.sideB.toStringAsFixed(1)}',
        Offset(pC.dx - 15, (pC.dy + pB.dy) / 2), // Слева от стороны B
        color: inputSideName == 'B' ? highlightColor : textColor,
        fontSize: sideFontSize,
        alignment: Alignment.centerRight);

    // Сторона C (гипотенуза, между pA и pB)
    drawText(
        'C = ${triangle.sideC.toStringAsFixed(1)}',
        Offset((pA.dx + pB.dx) / 2 + 12,
            (pA.dy + pB.dy) / 2 - 12), // Рядом с гипотенузой
        color: inputSideName == 'C' ? highlightColor : textColor,
        fontSize: sideFontSize);

    // Подписи углов
    // Угол A (30°) - у вершины pA
    drawText('30°', Offset(pA.dx - 22, pA.dy - 20),
        fontSize: angleFontSize, alignment: Alignment.center, color: textColor);
    // Угол B (60°) - у вершины pB
    drawText('60°', Offset(pB.dx + 22, pB.dy + 20),
        fontSize: angleFontSize, alignment: Alignment.center, color: textColor);
    // Угол C (90°) - у вершины pC (прямой угол)
    // Рисуем квадратик для прямого угла
    Rect rightAngleRect = Rect.fromPoints(
        Offset(pC.dx, pC.dy - 12), // верхняя точка квадратика
        Offset(pC.dx + 12, pC.dy) // правая точка квадратика
        );
    // Для темной темы квадратик тоже должен быть светлым
    final Paint rightAnglePaint = Paint()
      ..color =
          paint.color // Используем тот же цвет, что и для линий треугольника
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawRect(rightAngleRect, rightAnglePaint);
  }

  @override
  bool shouldRepaint(covariant TrianglePainter oldDelegate) {
    // Перерисовываем, если изменился сам треугольник или выделенная сторона
    return oldDelegate.triangle.sideA != triangle.sideA ||
        oldDelegate.inputSideName != inputSideName ||
        oldDelegate.textColor !=
            textColor || // Добавляем проверку на смену цвета
        oldDelegate.highlightColor != highlightColor;
  }
}
