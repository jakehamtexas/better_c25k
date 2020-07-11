import 'package:flutter/material.dart';

import '../../../domain/entities/preferences/preferences_entity.dart';
import 'control_view.dart';
import 'preferences_base.dart';
import 'save_bar.dart';

class PreferencesWithSaveBar extends StatelessWidget
    implements PreferencesBase {
  final PreferencesEntity preferences;
  const PreferencesWithSaveBar(this.preferences);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PreferencesWithoutSaveBar(preferences),
        SaveBar(preferences)
      ],
    );
  }
}
