import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
final appExt = AppExt();
/// [AppExt] is a extension class to access the AppContext.
class AppExt {
  /// [pixelRatio] is the pixel ratio of the device.
  double get pixelRatio => ui.window.devicePixelRatio;
  /// [size] is the size of the device.
  Size get size => ui.window.physicalSize / pixelRatio;
  /// [width] is the width of the device.
  double get width => size.width;
  /// [height] is the height of the device.
  double get height => size.height;
  /// [columnSpacer] is a Custom Spacer to add space between columns.
  Widget columnSpacer({double? height}) => SizedBox(
    height: height ?? width * 0.05,
  );
  /// [rowSpacer] is a Custom Spacer to add space between rows.
  Widget rowSpacer({double? width}) => SizedBox(
    width: width ?? height * 0.02,
  );
  /// push is a method to push a new widget.
  /// [page] will be the widget to be pushed.
  Future<dynamic> push(Widget page, BuildContext ctx) =>
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
  /// pushReplacement is a method to push a new widget and replace the current widget.
  /// [page] will be the widget to be replaced.
  Future<dynamic> pushReplacement(Widget page, BuildContext ctx) =>
      Navigator.of(ctx).pushReplacement(PageRouteBuilder(
          transitionDuration: const Duration(seconds: 2),
          pageBuilder: (context, _, __) => page));
  /// pushAndRemoveUntil is a method to push a new widget and remove all the previous widgets.
  /// [page] will be the widget to be pushed.
  Future<dynamic> pushAndRemoveUntil(Widget page, BuildContext ctx) =>
      Navigator.of(ctx).pushAndRemoveUntil(
          PageRouteBuilder(
              transitionDuration: const Duration(seconds: 2),
              pageBuilder: (context, _, __) => page),
              (_) => false);
/// pop is a method to pop the current widget.
/// [result] will pass the data from the previous widget to current widget.
//void pop([Object? result]) => Navigator.of(ctx!).pop(result);
}

void printLog(message) {
  if (!kReleaseMode) {
    log('$message');
  }
}