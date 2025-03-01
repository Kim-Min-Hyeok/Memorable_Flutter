import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:memorable/utilities/app_theme.dart';
import 'package:memorable/views/HomeView.dart';
import 'package:memorable/views/TestsheetView.dart';
import 'package:memorable/views/WorksheetView.dart';
import 'package:memorable/views/WrongsheetView.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1210, 834),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.regularTheme,
        builder: (BuildContext context, Widget? child) {
          final data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(
                textScaleFactor: data.textScaleFactor >= 1.4 ? 1.4 : 1.0),
            child: child!,
          );
        },
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const HomeView()),
          GetPage(name: '/worksheet', page: () => const WorksheetView()),
          GetPage(name: '/testsheet', page: () => const TestsheetView()),
          GetPage(name: '/wrongsheet', page: () => const WrongsheetView())
        ],
      ),
    );
  }
}