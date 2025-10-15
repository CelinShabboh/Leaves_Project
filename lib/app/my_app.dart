import 'package:dental_project/core/data/repository/shared_prefrence_repository.dart';
import 'package:dental_project/core/translation/app_translation.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:dental_project/ui/views/intro_view/into_view.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPrefrenceRepository sharedPreferencesService =
      SharedPrefrenceRepository();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      locale: getLocal(),
      translations: AppTranslation(),
      navigatorObservers: [BotToastNavigatorObserver()],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroView());
      // home: FutureBuilder<bool>(
      //   future: SharedPrefrenceRepository.isAuth(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) return SplashView();
      //     return snapshot.data! ? DashboardView() : LoginView();
      //   },
      // ),
   // );
  }
}

Locale getLocal() {
  String langCode = storage.getAppLanguage();
  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else if (langCode == 'tr')
    return Locale('tr', 'TR');
  else
    return Locale('fr', 'FR');
}
