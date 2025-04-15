import 'package:flutter/material.dart';
import 'drawer.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Color backgroundColor;

  const PageWrapper({
    Key? key,
    required this.child,
    required this.title,
    this.actions,
    this.floatingActionButton,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          ...(actions ?? []),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const AppDrawer(),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
