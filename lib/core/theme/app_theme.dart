import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.white,
  // accentColor: AppColors.assets,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.white,
    // actionsIconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
  scaffoldBackgroundColor: AppColors.background,

  // fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
