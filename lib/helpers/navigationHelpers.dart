import 'package:flutter/material.dart';

class NavigatorHelper {
  void toSpecificPage({required BuildContext context, required Widget widget}) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => widget)
    );
  }

  void toPreviousPage({required BuildContext context}) {
    Navigator.pop(context);
  }
}