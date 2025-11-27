import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:no_screenshot/no_screenshot.dart';
import 'package:screenshot_guard/screenshot_guard.dart';

/// A class that provides methods to disable and enable screenshot capture on
/// Android, iOS, macOS and Windows.
class ZOTScreenGuard {
  /// Disable screenshot capture on Android, iOS, macOS and Windows.
  ///
  /// This method will prevent the device from taking screenshots or recording
  /// the screen.
  ///
  /// If the platform is not supported, it will print a log message saying
  /// "Screenshot prevention not supported".
  ///
  /// If an error occurs while disabling screenshot capture, it will print a
  /// log message saying "Screenshot prevention not supported" and the error
  /// message.
  ///
  /// This method is a no-op on web.
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

  /// Enable screenshot capture on Android, iOS, macOS and Windows.
  ///
  /// This method will allow the device to take screenshots or record
  /// the screen.
  ///
  /// If the platform is not supported, it will print a log message saying
  /// "Screenshot prevention not supported".
  ///
  /// If an error occurs while enabling screenshot capture, it will print a
  /// log message saying "Screenshot prevention not supported" and the error
  /// message.
  ///
  /// This method is a no-op on web.
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
