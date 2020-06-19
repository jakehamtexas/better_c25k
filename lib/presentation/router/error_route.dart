import 'package:flutter/material.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How did you get here?'),
      ),
      body: const Center(
        child: Text("You can't be here!"),
      ),
    );
  });
}
