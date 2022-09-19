import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/widgets/main_button_widget.dart';
import 'package:get/get.dart';

class DialogUtils {
  static final DialogUtils _dialogUtils = DialogUtils._internal();

  factory DialogUtils() {
    return _dialogUtils;
  }

  static void showAlertBottomSheet(
      BuildContext context,{
    required String text,
    required String acceptText,
    required String declineText,
    required Color mainColor,
    required Widget iconWidget,
    required VoidCallback onAccept,
    VoidCallback? onDecline,
    double heightFactor = 0.3,
  }) {
    Get.bottomSheet(
      FractionallySizedBox(
        heightFactor: heightFactor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mainColor,
                      border: Border.all(
                        width: 2,
                        color: mainColor,
                      ),
                    ),
                    child: iconWidget,
                  ),
                  Text(
                    text,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MainCustomerOutLineButtonWidget(
                          isEnabled: true,
                          height: 48,
                          primaryColor: Theme.of(context).primaryColor,
                          text: declineText,
                          onTap: () {
                            if (onDecline == null) {
                              Get.back();
                            } else {
                              onDecline();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: MainButtonWidget(
                          height: 48,
                          isEnabled: true,
                          primaryColor: mainColor,
                          text: acceptText,
                          onTap: onAccept,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  static void showMainSearchBottomSheet(
    BuildContext context, {
    required String title,
    required List<Widget> child,
    bool isScrollControlled = true,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 80),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                  color: Colors.red,
                ),
                child: Container(),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...child,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: isScrollControlled,
    );
  }

  static void showMainSelectBottomSheet(
    BuildContext context, {
    required String title,
    required Widget child,
    bool isScrollControlled = true,
  }) {
    Get.bottomSheet(
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: isScrollControlled,
    );
  }

  static void getDialog({
    required String message,
    required Function onTap,
    required Color primaryColorButton,
    required SvgPicture bavSvg,
    String buttonText = 'Done',
    bool showIcon = true,
    bool showButton = true,
  }) {
    Get.dialog(
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0.0),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        if (showIcon) bavSvg,
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (showButton)
                          MainButtonWidget(
                            isEnabled: true,
                            primaryColor: primaryColorButton,
                            text: buttonText,
                            onTap: () {
                              onTap();
                            },
                          ),
                        if (showButton)
                          const SizedBox(
                            height: 16,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void closeFlowDialog({
    required String message,
    required Color primaryColorButton,
    required VoidCallback onGetOffAll,
  }) {
    Get.dialog(
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0.0),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MainButtonWidget(
                                isEnabled: true,
                                primaryColor: primaryColorButton,
                                text: 'No',
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: MainCustomerOutLineButtonWidget(
                                isEnabled: true,
                                primaryColor: primaryColorButton,
                                text: 'Yes',
                                onTap: () {
                                  onGetOffAll();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DialogUtils._internal();
}
