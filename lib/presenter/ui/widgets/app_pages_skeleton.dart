import 'package:flutter/material.dart';

import 'navigation_drawer_widget.dart';

class AppSkelecte extends StatelessWidget {
  const AppSkelecte({Key? key, required this.child}) : super(key: key);
    final Widget child;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    return
      Scaffold(
        key: _globalKey,
        drawer: NavigationDrawerWidget().navigationDrawer(),

        body: Stack(
          children: [
            child,
            IconButton(
                onPressed: () {
                  _globalKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu)),

          ],
        ));
  }
}
