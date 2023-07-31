import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skripsi_kos_app/sources/modules/views/splash.view.dart';

import 'bindings.dart';
import 'sources/modules/views/views.dart';

// Run after flutter clean
// dart run flutter_native_splash:create --path=flutter_native_splash.yaml

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await GetStorage.init();

  setSystemUIOverlayStyle(Colors.white);

  runApp(
    const MainApp(),
  );
}

Future setSystemUIOverlayStyle(final Color color) async {
  // Setting SystemUIMode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.bottom],
  );

  // Setting SystemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: true,
      statusBarColor: color.withOpacity(0.002),
      systemNavigationBarColor: color.withOpacity(0.002),
      systemNavigationBarDividerColor: color.withOpacity(0.002),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Setting Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Boarding House Application',
          initialRoute: '/',
          initialBinding: AuthBinding(),
          getPages: [
            GetPage(
              name: '/',
              page: () => const SplashScreenView(),
              bindings: [
                SplashScreenBinding()
              ]
            ),
            GetPage(
              name: '/auth',
              page: () => const AuthView(),
              bindings: [
                AuthBinding(),
                NavBinding(),
              ],
            ),
            GetPage(
              name: '/signin',
              page: () => const LoginView(),
            ),
            GetPage(
              name: '/signup',
              page: () => const SignUpView(),
            ),
            GetPage(
              name: '/user/nav',
              page: () => const UserNavigationView(),
            ),
            GetPage(
              name: '/postman/nav',
              page: () => PostmanNavigationView(),
              bindings: [
                TextScannerBinding(),
              ],
            ),
            GetPage(
              name: '/admin/nav',
              page: () => AdminNavigationView(),
              bindings: [
                FilePickerBinding(),
              ],
            ),
            GetPage(
              name: '/signup/regis-building',
              page: () => const RegisterBuildingView(),
            ),
            GetPage(
              name: '/admin/resident',
              page: () => const AdminResidentNavigationView(),
            ),
            GetPage(
              name: '/admin/detail',
              page: () => const DetailTransactionNavigationView(),
            ),
            GetPage(
              name: '/postman/form',
              page: () => const PostmanFormPageNavigationView(),
            ),
            GetPage(
              name: '/postman/scanner',
              page: () => const TextScannerView(),
            ),
          ],
        );
      },
    );
  }
}
