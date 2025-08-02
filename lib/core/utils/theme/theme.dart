import 'package:flutter/material.dart';
import '../color_resource/color_resource.dart';

ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(surfaceTintColor: ColorResources.white),
  scaffoldBackgroundColor: ColorResources.white,
  primaryColor:ColorResources.primary,
  canvasColor:ColorResources.white,
  colorScheme: ThemeData().colorScheme.copyWith(primary: ColorResources.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: ColorResources.white),
  bottomSheetTheme: BottomSheetThemeData(
    surfaceTintColor: ColorResources.white,
    backgroundColor: ColorResources.white,
  ),
  dialogTheme: DialogTheme(surfaceTintColor: ColorResources.white),
  dialogBackgroundColor: ColorResources.white,
  brightness: Brightness.light,
  cardTheme: CardTheme(surfaceTintColor: ColorResources.white,color: ColorResources.white),
  scrollbarTheme: const ScrollbarThemeData(
      thickness: MaterialStatePropertyAll(5),
      minThumbLength: 20
  ),
  iconTheme: const IconThemeData(
      size: 15
  ),
);