import 'package:e_space_mobile/controller/auth/web_view_controller.dart'
    as t;
import 'package:e_space_mobile/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class AuthPage extends GetView<t.WebViewController> {
  final controller = Get.put(t.WebViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebviewScaffold(
          url: Constants.oneIdUrl,
          clearCookies: true,
          clearCache: true,
        ),
      ),
    );
  }
}
