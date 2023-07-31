import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../themes/colors/colors.dart';

import '../../../widgets/button.dart';
import '../controllers/splashscreen.controller.dart';
import 'asset_loader_widget.dart';
import 'views.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorsTheme.primary,
      body: SizedBox(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Stack(
          children: [
            Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 48),
                    child: Obx(
                      () => LinearProgressIndicator(
                        value: controller.splashProgress(),
                        backgroundColor: ColorsTheme.disabled,
                        valueColor: const AlwaysStoppedAnimation(
                          ColorsTheme.back1,
                        ),
                      ),
                    ),
                  ),
                ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: deviceSize.width / 3,
                    child: const AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image(
                        image: AssetImage(
                            'lib/assets/images/app_launcher_icon.png'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    child: Text(
                      'Welcome to MyApp',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: ColorsTheme.onPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    child: Text(
                      'Build Apps Effortlessly',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: ColorsTheme.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
