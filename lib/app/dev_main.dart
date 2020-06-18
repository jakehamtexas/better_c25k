import 'package:flutter/material.dart';

import 'app_config.dart';
import 'better_c25k.dart';

// TODO: Add DI

void main() => runApp(
      AppConfig(
        appName: "Better C25K DEV",
        flavorName: "development",
        isDev: true,
        child: BetterC25K(),
      ),
    );
