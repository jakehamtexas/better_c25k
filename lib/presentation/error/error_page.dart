import 'package:flutter/material.dart';

import '../../core/error/error.dart';
import '../router/routes.dart';

class ErrorPage extends StatelessWidget {
  final Failure _failure;
  const ErrorPage(this._failure);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
      ),
      body: Center(
        child: Text(_failure.message),
      ),
    );
  }
}

class NavigateToDefaultErrorPage {
  Future<Object> Function(Failure) call(BuildContext context) =>
      (failure) => Navigator.of(context).pushNamed(
            Routes.error,
            arguments: failure,
          );
}
