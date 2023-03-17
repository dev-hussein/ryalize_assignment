
import 'package:flutter/material.dart';
import 'package:ryalize_assignment/constants/app_colors.dart';
import 'package:ryalize_assignment/utils/resources/fonts/fonts_family_style.dart';
import 'package:ryalize_assignment/utils/theming/screen_util.dart';




///
/// Handle the app theme configuration
/// set the colors and text styles
///

class AppDarkTheme  {
  static final AppDarkTheme _instance = AppDarkTheme._();

  AppDarkTheme._();

  factory AppDarkTheme() => _instance;

  ThemeData get themeDarkData => ThemeData(
      scaffoldBackgroundColor:AppColors.colorFFFFFF ,
      primaryColor: AppColors.color6C6DB5,
      disabledColor: AppColors.color909090,
      primaryColorDark: AppColors.color000000,
      primaryColorLight: AppColors.colorFFFFFF,
      sliderTheme: const SliderThemeData(
        activeTrackColor: AppColors.color000000,
        inactiveTrackColor: AppColors.colorE0E0E0,
      ),
      textTheme: TextTheme(
        titleMedium: FontFamilyStyle.standardTextStyleW700(fontSize: 30.toFont),
        labelMedium: FontFamilyStyle.standardTextStyleW500(fontSize: 18.toFont,color: AppColors.color909090),
        bodyMedium: FontFamilyStyle.standardTextStyleW700(fontSize: 17.toFont),
        bodySmall: FontFamilyStyle.standardTextStyleW500(fontSize: 16.toFont),
        bodyLarge: FontFamilyStyle.standardTextStyleW500(fontSize: 18.toFont,),
        titleLarge: FontFamilyStyle.standardTextStyleW700(fontSize: 32.toFont,),
        labelSmall: FontFamilyStyle.standardTextStyleW400(fontSize: 14.toFont,),
      )
  );
}


class AppLightTheme  {
  static final AppLightTheme _instance = AppLightTheme._();

  AppLightTheme._();

  factory AppLightTheme() => _instance;
  ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor:AppColors.colorFFFFFF ,
      primaryColor: AppColors.color6C6DB5,
      disabledColor: AppColors.color909090,
      primaryColorDark: AppColors.color000000,
      primaryColorLight: AppColors.colorFFFFFF,
      sliderTheme: const SliderThemeData(
          activeTrackColor: AppColors.color000000,
          inactiveTrackColor: AppColors.colorE0E0E0
      ),
      textTheme: TextTheme(
        titleMedium: FontFamilyStyle.standardTextStyleW700(fontSize: 30.toFont),
        labelMedium: FontFamilyStyle.standardTextStyleW500(fontSize: 18.toFont,color: AppColors.color909090),
        bodyMedium: FontFamilyStyle.standardTextStyleW700(fontSize: 17.toFont),
        bodySmall: FontFamilyStyle.standardTextStyleW500(fontSize: 16.toFont),
        bodyLarge: FontFamilyStyle.standardTextStyleW500(fontSize: 18.toFont,),
        titleLarge: FontFamilyStyle.standardTextStyleW700(fontSize: 32.toFont,),
        labelSmall: FontFamilyStyle.standardTextStyleW400(fontSize: 14.toFont,),
      )
  );

}
