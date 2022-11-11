import 'package:flutter/material.dart';

import 'navigation_drawer_widget.dart';

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({Key? key, required this.child, this.button}) : super(key: key);
    final Widget child;
    final FloatingActionButton? button;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    return
      Scaffold(
        key: _globalKey,
        drawer: NavigationDrawerWidget().navigationDrawer(),
          floatingActionButton: button,
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
