import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skripsi_kos_app/widgets/widgets.dart';
import '../../../../themes/colors/colors.dart';
import '../../controllers/controllers.dart';
import '../../views/views.dart';
import '../../models/models.dart';
import '../../../services/services.dart';

class UserNavigationView extends GetView<NavController> {
  const UserNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
        child: Center(
          child: Card(
            color: ColorsTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ReText(
                    text: 'Im User',
                    isHeading: true,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme.onPrimary,
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    IconsaxBold.arrow_down,
                    size: 56,
                    color: ColorsTheme.onPrimary,
                  ),
                  ReElevatedButton(
                    onPressed: () {
                      controller.ctrlAuth.signOut();
                    },
                    child: const ReText(
                      text: 'Sign Out',
                      color: ColorsTheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => ReNavbar(
          index: controller.selectedIndex(),
          onTap: (value) {
            controller.selectedIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                IconsaxBold.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconsaxBold.setting_2,
              ),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
