import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BigWorkoutText extends AutoSizeText {
  BigWorkoutText(String text)
      : super(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 80,
          ),
        );
}
