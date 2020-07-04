import 'package:flutter/material.dart';

import '../router/routes.dart';

class C25kBottomNav extends StatelessWidget {
  final int index;
  final BuildContext context;
  const C25kBottomNav({
    Key key,
    @required this.index,
    @required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      items: _items(context),
      onTap: (_) {},
    );
  }

  static void Function() Function(String) _onPressed(BuildContext context) =>
      (String route) => () => Navigator.of(context).pushReplacementNamed(route);

  static const Map<String, IconData> _routeIconsByRouteName = {
    Routes.regimen: Icons.home,
    Routes.analysis: Icons.equalizer,
    Routes.preferences: Icons.settings
  };

  static List<BottomNavigationBarItem> _items(BuildContext context) {
    const noTextTitle = Text(
      "",
      textScaleFactor: 0,
    );
    final themeData = Theme.of(context);
    Widget getIcon(String route, IconData iconData) => RawMaterialButton(
          onPressed: _onPressed(context)(route),
          shape: const CircleBorder(),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Icon(iconData),
        );
    Widget getActiveIcon(String route, IconData iconData) => RawMaterialButton(
          shape: const CircleBorder(),
          fillColor: themeData.accentColor,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: _onPressed(context)(route),
          child: Icon(
            iconData,
            color: themeData.backgroundColor,
          ),
        );
    BottomNavigationBarItem getNavBarItem(String route, IconData iconData) =>
        BottomNavigationBarItem(
          icon: getIcon(route, iconData),
          title: noTextTitle,
          activeIcon: getActiveIcon(route, iconData),
        );
    return _routeIconsByRouteName.entries.map(
      (entry) {
        final route = entry.key;
        final iconData = entry.value;
        return getNavBarItem(route, iconData);
      },
    ).toList();
  }
}
