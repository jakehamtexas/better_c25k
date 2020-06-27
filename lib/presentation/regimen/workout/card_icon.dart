import 'package:better_c25k/constant/completion_status.dart';
import 'package:flutter/material.dart';

import '../../../constant/completion_status.dart';

class CardIcon extends Icon {
  const CardIcon(IconData icon) : super(icon);
  factory CardIcon.collapsed(CompletionStatus completionStatus) {
    switch (completionStatus) {
      case CompletionStatus.notStarted:
        return CardIcon(
          Icons.arrow_drop_down,
        );
      case CompletionStatus.inProgress:
        return CardIcon(
          Icons.refresh,
        );
      case CompletionStatus.completed:
        return CardIcon(
          Icons.check,
        );
      default:
        throw UnimplementedError();
    }
  }
  factory CardIcon.expanded(CompletionStatus completionStatus) {
    switch (completionStatus) {
      case CompletionStatus.notStarted:
        return CardIcon(
          Icons.arrow_drop_up,
        );
      case CompletionStatus.inProgress:
        return CardIcon(
          Icons.refresh,
        );
      case CompletionStatus.completed:
        return CardIcon(
          Icons.check,
        );
      default:
        throw UnimplementedError();
    }
  }
}
