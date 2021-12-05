import 'package:e_space_mobile/bindings/area/application_details_binding.dart';
import 'package:e_space_mobile/bindings/auth/web_view_binding.dart';
import 'package:e_space_mobile/bindings/main/application_binding.dart';
import 'package:e_space_mobile/bindings/main/main_bindings.dart';
import 'package:e_space_mobile/bindings/map/map_binding.dart';
import 'package:e_space_mobile/bindings/map/simple_map_binding.dart';
import 'package:e_space_mobile/bindings/profile/my_application_details_binding.dart';
import 'package:e_space_mobile/ui/auth/auth.dart';
import 'package:e_space_mobile/ui/main/area/aplication_details/aplication_details_page.dart';
import 'package:e_space_mobile/bindings/profile/my_application_binding.dart';
import 'package:e_space_mobile/ui/main/home/applicaton/main_application_page.dart';
import 'package:e_space_mobile/ui/main/main_page.dart';
import 'package:e_space_mobile/ui/main/map/map/google_map_page.dart';
import 'package:e_space_mobile/ui/main/map/simple_map/simpe_map_page.dart';
import 'package:e_space_mobile/ui/main/my_applications/my_application_details.dart';
import 'package:e_space_mobile/ui/main/my_applications/my_applications.dart';
import 'package:e_space_mobile/ui/main/profile/personal_info/personal_info.dart';
import 'package:e_space_mobile/ui/splash/splash_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),

    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.APPLICATION_DETAILS,
      page: () => ApplicationDetailsPage(),
      binding: ApplicationDetailsBinding(),
    ),
    GetPage(
      name: Routes.GOOGLE_MAP,
      page: () => GoogleMapPage(),
      transition: Transition.zoom,
      binding: MapBinding(),
    ),
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.PERSONAL_INFO,
      page: () =>  PersonalInfoPage(),
    ),
    GetPage(
      name: Routes.WEB_VIEW,
      page: () => AuthPage(),
      binding: WebViewBinding(),
    ),
    GetPage(
      name: Routes.APPLICATION,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: Routes.MY_APPLICATIONS,
      page: () => MyApplicationsPage(),
      binding: MyApplicationBinding()
    ),
    GetPage(
        name: Routes.MY_APPLICATION_DETAIL,
        page: () => MyApplicationDetailsPage(),
        binding: MyApplicationDetailsBinding()
    ),

    GetPage(
        name: Routes.SIMPLE_MAP,
        page: () => SimpleMapPage(),
        binding: SimpleMapBinding()
    ),

  ];
}
