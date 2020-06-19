import 'package:flutter/material.dart';

import 'app_config.dart';
import 'better_c25k.dart';

// TODO: Add DI
// TODO: Add usage of appconfig throughout presentation

void main() => runApp(
      AppConfig(
        appName: "Better C25K",
        flavorName: "production",
        isDev: false,
        child: BetterC25K(),
      ),
    );
