import 'package:anamel/routes/GoRouterGenerator.dart';
import 'package:anamel/styling/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder:(context, child){
        return MaterialApp.router(
          title: "Amanel",
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: ThemeMode.light,
          // home: child,
          routerConfig: GoRouterGenerator.mainRouter,

        );
      },
      // child: const SplashScreen(),
    );
  }
}
