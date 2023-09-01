import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/data/local/my_shared_pref.dart';
import 'package:sezon_app/app/routes/app_pages.dart';
import 'package:sezon_app/config/theme/my_theme.dart';
import 'package:sezon_app/config/translations/localization_service.dart';
import 'package:sezon_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPref.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "Sezon App",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          builder: (context,widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              ),
            );
          },
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          locale: MySharedPref.getCurrentLocal(),
          translations: LocalizationService.getInstance(),
        );
      },
    );
  }
}

