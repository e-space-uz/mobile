import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/core/constants/constants.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class WebViewController extends BaseController {
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  @override
  void onInit() {
    super.onInit();
    flutterWebViewPlugin.onUrlChanged.listen((String url) async {
      Uri.parse(url).queryParameters.forEach((key, value) {
        print('BACK URL CODE LAST  --$key -- $value');
      });

      if (url.contains(Constants.redirectUrl)) {
        String code = Uri.parse(url).queryParameters['code'] ?? 'no Url';
        Get.back(result: code);
      }
    });
    flutterWebViewPlugin.clearCache();
    flutterWebViewPlugin.cleanCookies();
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebViewPlugin.dispose();
  }
}
