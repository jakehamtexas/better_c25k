/// The kind of exercise being done. This can be a pre- or post-
/// workout action, like a warmup or cooldown, or an in-progress workout
/// action, like walking or running.
enum ExerciseAction { warmup, walk, run, cooldown }

extension ExerciseActionMessage on ExerciseAction {
  static const Map<ExerciseAction, String> _messagesByAction = {
    ExerciseAction.warmup: "Warmup",
    ExerciseAction.walk: "Walk",
    ExerciseAction.run: "Run",
    ExerciseAction.cooldown: "Cooldown",
  };
  String get message =>
      _messagesByAction.containsKey(this) ? _messagesByAction[this] : "Unknown";
}
