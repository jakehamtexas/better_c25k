import 'package:flutter/material.dart';

import '../../../domain/entities/preferences/preferences_entity.dart';
import 'preferences_base.dart';

class PreferencesWithoutSaveBar extends StatelessWidget
    implements PreferencesBase {
  final PreferencesEntity preferences;
  const PreferencesWithoutSaveBar(this.preferences);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
