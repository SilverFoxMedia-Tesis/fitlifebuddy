// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXDialog {
  static GetXDialog _instance = GetXDialog._init();

  factory GetXDialog() {
    return _instance;
  }

  GetXDialog._init();

  static set instance(GetXDialog overrideInstance) {
    _instance = overrideInstance;
  }

  /// bool Function()?  [onClose]
  ///   - return false to prevent onWillPop scope and keep dialog open
  ///   - return true to close dialog
  Future<dynamic> showDialog(
    Widget content, {
    bool barrierDismissible = true,
    bool Function()? onClose,
  }) {
    return Get.generalDialog(
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 0),
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      pageBuilder: (ctx, anim1, anim2) => WillPopScope(
        child: content,
        onWillPop: () async {
          if (onClose != null) return onClose();
          return true;
        },
      ),
    );
  }
}
