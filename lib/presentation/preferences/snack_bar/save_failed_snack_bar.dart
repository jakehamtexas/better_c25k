import 'package:flutter/material.dart';

class SaveFailedSnackBar extends SnackBar {
  const SaveFailedSnackBar()
      : super(
          content: const Text("Save failed! Please try again."),
        );
}
