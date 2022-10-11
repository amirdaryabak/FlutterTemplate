import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController textController;
  final FocusNode? focusNode;
  final bool isEmpty;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final Function() onIconTap;
  final TextInputType keyboardType;
  final Color fillColor;
  final bool isEnabled;
  final int? maxLength;

  const MainTextField({
    Key? key,
    required this.labelText,
    required this.textController,
    required this.focusNode,
    required this.isEmpty,
    required this.onChanged,
    this.onSubmitted,
    required this.onIconTap,
    this.keyboardType = TextInputType.name,
    this.fillColor = Colors.white,
    this.isEnabled = true,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      enabled: isEnabled,
      controller: textController,
      focusNode: focusNode,
      onChanged: (text) {
        onChanged(text);
      },
      onSubmitted: (text) {
        onSubmitted?.call(text);
      },
      keyboardType: keyboardType,
      textDirection: keyboardType == TextInputType.number ? TextDirection.ltr : TextDirection.rtl,
      inputFormatters: keyboardType == TextInputType.number ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        counterText: '',
        labelText: labelText,
        fillColor: isEnabled ? fillColor : Theme.of(context).backgroundColor,
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: isEmpty && focusNode?.hasFocus == true && isEnabled
            ? IconButton(
                icon: const Icon(Icons.cancel),
                color: Theme.of(context).backgroundColor,
                onPressed: onIconTap,
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: isEmpty
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).backgroundColor),
              )
            : null,
        disabledBorder: isEmpty
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).backgroundColor),
              )
            : null,
      ),
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}

class MainDropDownTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final bool isEmpty;
  final Function() onTap;
  final Widget? suffixIcon;
  final Color fillColor;
  final bool isEnabled;

  const MainDropDownTextField({
    Key? key,
    required this.labelText,
    required this.textController,
    required this.isEmpty,
    required this.onTap,
    this.suffixIcon = const Icon(Icons.arrow_drop_down_outlined),
    this.fillColor = Colors.white,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextField(
        enabled: false,
        controller: textController,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.all(20),
          fillColor: isEnabled ? fillColor : Theme.of(context).backgroundColor,
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          disabledBorder: isEmpty
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Theme.of(context).backgroundColor),
                )
              : null,
        ),
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
