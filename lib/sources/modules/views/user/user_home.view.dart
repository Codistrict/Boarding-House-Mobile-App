import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../themes/colors/colors.dart';

import '../../../../widgets/widgets.dart';
import '../../controllers/controllers.dart';
import '../views.dart';

class UserHomeView extends GetView<NavController> {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReText(
            text: 'WELCOME, User',
            isHeading: true,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorsTheme.primary,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 2,
            color: ColorsTheme.primary,
            height: 32,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReText(
                text: 'On Going',
                isHeading: true,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsTheme.primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
              ),
              child: Obx(
                () => packageList(
                  controller.ctrlPackage.listPackage(),
                  true,
                  false,
                  1,
                  controller,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReText(
                text: 'History',
                isHeading: true,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsTheme.primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
              ),
              child: Obx(
                () => packageList(
                  controller.ctrlPackage.listPackageHistory(),
                  false,
                  true,
                  1,
                  controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
