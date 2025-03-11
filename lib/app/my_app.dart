import 'package:dental_project/core/data/repository/shared_prefrence_repository.dart';
import 'package:dental_project/core/translation/app_translation.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:dental_project/ui/views/dashboard_view/dashboard_view.dart';
import 'package:dental_project/ui/views/diagnoses_view/diagnosis_form.dart';
import 'package:dental_project/ui/views/doctor_form/doctor_form.dart';
import 'package:dental_project/ui/views/intro_view/intro_view.dart';
import 'package:dental_project/ui/views/diagnoses_view/display_diagnoses_view.dart';
import 'package:dental_project/ui/views/patient_details_view/display_patients_view.dart';
import 'package:dental_project/ui/views/patient_details_view/patient_details_view.dart';

import 'package:dental_project/ui/views/bills_form_view/bills_form.dart';
import 'package:dental_project/ui/views/login_view.dart';
import 'package:dental_project/ui/views/treatment_plans_view/treatment_plans_view.dart';
import 'package:dental_project/ui/views/patient_data_form_view/patient_data_form_view.dart';
import 'package:dental_project/ui/views/patient_details_view/patient_details_view.dart';
import 'package:dental_project/ui/views/appointments_view/appointment_view.dart';
import 'package:dental_project/ui/views/splash_view/splash_view.dart';
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
        home: PatientDataForm());
    // home: sharedPreferencesService.isAuth()
    //     ? sharedPreferencesService.getUserType() == "user"
    //         ? HomeUserView()
    //         : HomeStudentView()
    //     : SplashView());
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
