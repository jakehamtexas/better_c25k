import '../router/routes.dart';

import '../../core/error/error.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Failure _failure;
  ErrorPage(this._failure);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ERROR'),
      ),
      body: Center(
        child: Text(_failure.message),
      ),
    );
  }
}

class LeftNavigateToDefaultErrorPage {
  Null Function(Failure) call(BuildContext context) =>
      (failure) => Navigator.of(context).pushNamed(
            Routes.error,
            arguments: failure,
          );
}
