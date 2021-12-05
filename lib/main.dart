import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'bindings/main/main_bindings.dart';
import 'core/theme/app_theme.dart';
import 'data/data_source/local_source.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'translations/app_translations.dart';

void main() async {
  await GetStorage.init();
  final currentLocale = LocalSource.getInstance().getLocale();
  runApp(MyApp(currentLocale: currentLocale));
}

class MyApp extends StatelessWidget {
  final String currentLocale;

  const MyApp({Key? key, required this.currentLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [GestureType.onTap],
      child: GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
        // navigatorKey: ApiClient.alice.getNavigatorKey(),
        theme: appThemeData,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          const Locale('ru', 'RU'),
          const Locale('uz', 'UZ'),
          const Locale('en', 'US'),
        ],
        debugShowCheckedModeBanner: false,
        initialBinding: MainBindings(),
        initialRoute: Routes.INITIAL,
        getPages: AppPages.pages,
        locale: Locale(currentLocale),
        translationsKeys: AppTranslations.translations,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }
}
