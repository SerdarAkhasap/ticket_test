import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:online_plane_ticket/app/pages/home/home_controller.dart';
import 'package:online_plane_ticket/app/pages/ticket_search/ticket_search_controller.dart';
import 'package:online_plane_ticket/app/utils/app_colors.dart';
import 'package:online_plane_ticket/app/utils/router.dart';
import 'package:online_plane_ticket/app/utils/theme.dart';
import 'package:online_plane_ticket/data/utils/dio_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initControllers();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.black, systemNavigationBarColor: AppColors.black));

    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: ' Online Plane Ticket',
      theme: appTheme,
      routeInformationParser: routes.routeInformationParser,
      routerDelegate: routes.routerDelegate,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}

Future<void> initControllers() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => DioController());
  Get.lazyPut(() => sharedPreferences, tag: 'preferences');
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => TicketSearchController());
}
