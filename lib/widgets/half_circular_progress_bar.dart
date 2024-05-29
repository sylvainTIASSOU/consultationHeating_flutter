import 'package:flutter/material.dart';
import 'dart:math';

class HalfCircularProgressBar extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final double currentValue;
  final double barWidth;
  final Color backgroundColor;
  final Color progressBarColor;

  HalfCircularProgressBar({
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    this.barWidth = 10.0,
    this.backgroundColor = Colors.grey,
    this.progressBarColor = Colors.blue,
  });


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(150, 150), // Adjust the size as needed
      painter: HalfCircularProgressBarPainter(
        minValue: minValue,
        maxValue: maxValue,
        currentValue: currentValue,
        barWidth: barWidth,
        backgroundColor: backgroundColor,
        progressBarColor: progressBarColor,
      ),
    );
  }
}

class HalfCircularProgressBarPainter extends CustomPainter {
  final double minValue;
  final double maxValue;
  final double currentValue;
  final double barWidth;
  final Color backgroundColor;
  final Color progressBarColor;

  HalfCircularProgressBarPainter({
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    required this.barWidth,
    required this.backgroundColor,
    required this.progressBarColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = barWidth;

    final progressBarPaint = Paint()
      ..color = progressBarColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = barWidth;

    final centerX = size.width / 2;
    final centerY = size.height;

    // Draw the background arc
    final backgroundRect = Rect.fromCircle(
      center: Offset(centerX, centerY),
      radius: size.width / 2,
    );
    canvas.drawArc(backgroundRect, pi, pi, false, paint);

    // Calculate the sweep angle for the progress bar
    final sweepAngle = pi * (currentValue - minValue) / (maxValue - minValue);

    // Draw the progress bar arc
    final progressBarRect = Rect.fromCircle(
      center: Offset(centerX, centerY),
      radius: size.width / 2,
    );
    canvas.drawArc(progressBarRect, pi, sweepAngle, false, progressBarPaint);

    // Draw the minimum and maximum value text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${minValue.toInt()}°C',
        style: TextStyle(color: Colors.black, ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    textPainter.paint(
      canvas,
      Offset(0, centerY - textPainter.height / 2 + 15),
    );

    textPainter.text = TextSpan(
      text: '${currentValue.toInt()}°C',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    textPainter.paint(
      canvas,
      Offset(centerX - textPainter.width / 2, centerY - textPainter.height / 2 - 15),
    );

    textPainter.text = TextSpan(
      text: '${maxValue.toInt()}°C',
      style: TextStyle(color: Colors.black),
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    textPainter.paint(
      canvas,
      Offset(size.width - textPainter.width, centerY - textPainter.height / 2 + 15),
    );

    // Add Fahrenheit values below Celsius values
    final fahrenheitTextPainter = TextPainter(
      text: TextSpan(
        text: '${celsiusToFahrenheit(minValue).toInt()}°F',
        style: TextStyle(color: Colors.black),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    fahrenheitTextPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    fahrenheitTextPainter.paint(
      canvas,
      Offset(0, centerY + textPainter.height / 2 + 20),
    );

    fahrenheitTextPainter.text = TextSpan(
      text: '${celsiusToFahrenheit(currentValue).toInt()}°F',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );

    fahrenheitTextPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    fahrenheitTextPainter.paint(
      canvas,
      Offset(centerX - fahrenheitTextPainter.width / 2, centerY + textPainter.height / 2 +20),
    );

    fahrenheitTextPainter.text = TextSpan(
      text: '${celsiusToFahrenheit(maxValue).toInt()}°F',
      style: TextStyle(color: Colors.black),
    );

    fahrenheitTextPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    fahrenheitTextPainter.paint(
      canvas,
      Offset(size.width - fahrenheitTextPainter.width, centerY + textPainter.height / 2 + 20),
    );



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  // Helper function to convert Celsius to Fahrenheit
  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }
}
