import 'package:flutter/material.dart';

import './home_body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Better C25K"),
        ),
        body: HomeBody(),
      );
}
