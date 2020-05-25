import 'dart:async';

import 'package:flutter/material.dart';

import '../exercise/exercise.dart';

class WorkoutInProgressWidget extends StatefulWidget {
  final List<ExerciseModel> _exercises;
  WorkoutInProgressWidget(this._exercises);

  @override
  State<StatefulWidget> createState() => _DoWorkoutState(_exercises);
}

class _DoWorkoutState extends State<WorkoutInProgressWidget> {
  final List<ExerciseModel> _exercises;

  int _exerciseIndex = 0;
  ExerciseModel get _currentExercise => _exercises[_exerciseIndex];
  String get _exerciseActionMessage => _currentExercise.exerciseAction.message;

  int _currentCountdownTime;
  Stopwatch _stopwatch;
  Timer _timer;

  bool _isPaused = false;
  bool _isStarted = false;

  _DoWorkoutState(this._exercises) {
    _currentCountdownTime = _currentExercise.durationInSeconds;
  }

  void _togglePaused() {
    _stopwatch.stop();
    if (_isPaused) {
      _stopwatch.start();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void startTimer() {
    _stopwatch = Stopwatch()..start();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_currentCountdownTime <= 0) {
          setState(() {
            _exerciseIndex++;
            _currentCountdownTime = _currentExercise.durationInSeconds;
          });
          timer.cancel();
          if (_exerciseIndex != _exercises.length) {
            startTimer();
          } else {
            goToWorkoutCompletePage();
          }
        } else if (_stopwatch.isRunning) {
          setState(() {
            _currentCountdownTime--;
          });
        }
      },
    );
  }

  void goToWorkoutCompletePage() {}

  Function _getButtonOnPressedHandler() {
    if (!_isStarted) {
      setState(() {
        _isStarted = true;
      });
      return startTimer;
    }

    return _togglePaused;
  }

  _getButtonMessage() {
    if (!_isStarted) return "Start";
    return _isPaused ? "Resume" : "Pause";
  }

  @override
  Widget build(BuildContext context) {
    final startStopMessage = _getButtonMessage();
    final buttonOnPressedHandler = _getButtonOnPressedHandler();
    return Column(children: <Widget>[
      RaisedButton(
        onPressed: buttonOnPressedHandler,
        child: Text(startStopMessage),
      ),
      Text("Time Remaining: $_currentCountdownTime"),
      Text(_exerciseActionMessage)
    ]);
  }

  @override
  void dispose() {
    _timer.cancel();
    _stopwatch.reset();
    super.dispose();
  }
}