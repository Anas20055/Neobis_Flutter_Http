import 'package:flutter/material.dart';
import 'package:my_clean_app/core/constants/app_colors.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: 'Muli',
    appBarTheme: appBarThem(),
    iconTheme: const IconThemeData(color: Colors.white),
    progressIndicatorTheme:const  ProgressIndicatorThemeData(color: Colors.white),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white,fontWeight: FontWeight.w100))


  );
}

AppBarTheme appBarThem(){
  return const AppBarTheme(
    color: AppColors.backgroundColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white,fontSize: 18)
  );
}