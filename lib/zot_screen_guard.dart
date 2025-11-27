import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:screenshot_guard/screenshot_guard.dart';

class ZOTScreenGuard {
  static Future<void> disableScreenCapture() async {
    if (kIsWeb) return;
    try {
      if ((Platform.isAndroid || Platform.isIOS || Platform.isMacOS)) {
        await NoScreenshot.instance.screenshotOff();
      } else if (Platform.isWindows) {
        await ScreenshotGuard().enableSecureFlag(enable: true);
      }
    } catch (e) {
      log("Screenshot prevention not supported");
      log(e.toString());
    }
  }

  static Future<void> enableScreenCapture() async {
    if (kIsWeb) return;
    try {
      if ((Platform.isAndroid || Platform.isIOS || Platform.isMacOS)) {
        await NoScreenshot.instance.screenshotOn();
      } else if (Platform.isWindows) {
        await ScreenshotGuard().enableSecureFlag(enable: false);
      }
    } catch (e) {
      log("Screenshot prevention not supported");
      log(e.toString());
    }
  }
}
