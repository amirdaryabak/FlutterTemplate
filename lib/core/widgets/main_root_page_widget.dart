import 'package:flutter/material.dart';

class MainAppRootWidget extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;

  const MainAppRootWidget({
    Key? key,
    this.backgroundColor = Colors.transparent,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: child,
            ),
          ],
        ),
      );
}
