import 'package:flutter/material.dart';

import './home_body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Better C25K"),
        ),
        body: HomeBody(), // Don't be such a homebody!
      );
}
