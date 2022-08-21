import 'package:flutter/material.dart';

class MainAppRootWidget extends StatelessWidget {
  final Widget child;
  // final String assetImage;

  const MainAppRootWidget({
    Key? key,
    // required this.assetImage,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Stack(
          children: [
            /*SvgPicture.asset(
              assetImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),*/
            Scaffold(
              backgroundColor: Colors.transparent,
              body: child,
            ),
          ],
        ),
      );
}
