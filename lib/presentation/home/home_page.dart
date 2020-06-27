import 'package:better_c25k/app/app_config.dart';
import 'package:flutter/material.dart';

import './home_body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appConfig.appName,
        ),
      ),
      body: HomeBody(), // Don't be such a homebody!
    );
  }
}
