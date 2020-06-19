import 'package:flutter/material.dart';

import 'app_config.dart';
import 'better_c25k.dart';

// TODO: Add DI

void main() => runApp(
      AppConfig(
        appName: "Better C25K",
        flavorName: "production",
        isDev: false,
        child: BetterC25K(),
      ),
    );
