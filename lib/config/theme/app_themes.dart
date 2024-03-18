part of '../../main.dart';
ThemeData _theme(){
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: 'Muli',
    appBarTheme: _appBarThem(),
    iconTheme: const IconThemeData(color: Colors.white),
    progressIndicatorTheme:const  ProgressIndicatorThemeData(color: Colors.white),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white,fontWeight: FontWeight.w100))


  );
}

AppBarTheme _appBarThem(){
  return const AppBarTheme(
    color: AppColors.backgroundColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white,fontSize: 18)
  );
}