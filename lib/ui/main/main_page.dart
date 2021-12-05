import 'package:e_space_mobile/controller/main/main_controller.dart';
import 'package:e_space_mobile/core/custom_paints/area_custom_paint.dart';
import 'package:e_space_mobile/core/custom_paints/home_custom_paint.dart';
import 'package:e_space_mobile/core/custom_paints/map_custom_paint.dart';
import 'package:e_space_mobile/core/custom_paints/profile_custom_paint.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/ui/main/home/main_home_page.dart';
import 'package:e_space_mobile/ui/main/map/main_map_page.dart';
import 'package:e_space_mobile/ui/main/profile/main_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'my_applications/my_applications.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            if (controller.bottomMenu != BottomMenu.HOME) {
              controller.setMenu(0);
              return false;
            }
            return true;
          },
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              body: IndexedStack(
                index: controller.bottomMenu.index,
                children: [
                  MainHomePage(),
                  MyApplicationsPage(),
                  MainMapPage(),
                  const MainProfilePage(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.bottomMenu.index,
                onTap: (i) => controller.setMenu(i),
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.assets,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.black3,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                ),
                unselectedFontSize: 12,
                selectedFontSize: 12,
                selectedItemColor: AppColors.assets,
                unselectedItemColor: AppColors.black3,
                backgroundColor: AppColors.white,
                elevation: 0,
                iconSize: 24,
                items: <BottomNavigationBarItem>[
                  _buildMenuItem(
                    icon: const CustomPaint(
                      painter: const HomeCustomPaint(
                        AppColors.black3,
                      ),
                      size: const Size(20, 20),
                    ),
                    activeIcon: const CustomPaint(
                      painter: const HomeCustomPaint(
                        AppColors.assets,
                      ),
                      size: const Size(20, 20),
                    ),
                    text: 'home'.tr,
                  ),
                  _buildMenuItem(
                    icon: const CustomPaint(
                      painter: const CustomAreaPaint(
                        AppColors.black3,
                      ),
                      size: const Size(20, 20),
                    ),
                    activeIcon: const CustomPaint(
                      painter: const CustomAreaPaint(
                        AppColors.assets,
                      ),
                      size: const Size(20, 20),
                    ),
                    text: 'my_applications'.tr,
                  ),
                  _buildMenuItem(
                    icon: const CustomPaint(
                      painter: const MapCustomPaint(
                        AppColors.black3,
                      ),
                      size: const Size(20, 20),
                    ),
                    activeIcon: const CustomPaint(
                      painter: const MapCustomPaint(
                        AppColors.assets,
                      ),
                      size: const Size(20, 20),
                    ),
                    text: 'map'.tr,
                  ),
                  _buildMenuItem(
                    icon: const CustomPaint(
                      painter: const ProfileCustomPaint(
                        AppColors.black3,
                      ),
                      size: const Size(20, 20),
                    ),
                    activeIcon: const CustomPaint(
                      painter: const ProfileCustomPaint(
                        AppColors.assets,
                      ),
                      size: const Size(20, 20),
                    ),
                    text: 'profile'.tr,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildMenuItem({
    required Widget icon,
    required Widget activeIcon,
    required String text,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: SizedBox(
          height: 24,
          width: 24,
          child: Center(child: icon),
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: SizedBox(
          height: 24,
          width: 24,
          child: Center(child: activeIcon),
        ),
      ),
      label: text,
    );
  }
}
