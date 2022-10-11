import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final bool isEnabled;
  final String text;
  final VoidCallback onTap;
  final Color? primaryColor;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double height;
  final double width;

  const MainButtonWidget({
    Key? key,
    required this.isEnabled,
    this.primaryColor,
    required this.onTap,
    this.text = 'Done',
    this.buttonStyle,
    this.textStyle,
    this.height = 48,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: isEnabled
            ? ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                minimumSize: MaterialStateProperty.all(const Size(190, 48)),
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor == null ? Theme.of(context).primaryColor : primaryColor!),
              )
            : ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                minimumSize: MaterialStateProperty.all(const Size(190, 48)),
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).backgroundColor),
              ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ?? Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

class MainCustomerOutLineButtonWidget extends StatelessWidget {
  final bool isEnabled;
  final String text;
  final Function() onTap;
  final Color primaryColor;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double height;
  final double width;

  const MainCustomerOutLineButtonWidget({
    Key? key,
    required this.isEnabled,
    required this.text,
    required this.onTap,
    required this.primaryColor,
    this.buttonStyle,
    this.textStyle,
    this.height = 48,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: isEnabled
            ? ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: primaryColor),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(230, 60)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              )
            : ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                minimumSize: MaterialStateProperty.all(const Size(190, 48)),
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).backgroundColor),
              ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style:textStyle ?? Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
