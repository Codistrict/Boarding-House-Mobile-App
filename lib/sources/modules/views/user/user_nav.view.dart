import 'dart:ui';

import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skripsi_kos_app/widgets/widgets.dart';
import '../../../../themes/colors/colors.dart';
import '../../controllers/controllers.dart';

class UserNavigationView extends GetView<NavController> {
  const UserNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
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
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ReText(
                    text: 'History',
                    isHeading: true,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme.primary,
                    textAlign: TextAlign.center,
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
              const SizedBox(height: 10),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch
                    },
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    physics: const ClampingScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: ColorsTheme.secondary),
                        ),
                        color: ColorsTheme.onPrimary,
                        child: const ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReText(
                                    text: 'SPX000111*******',
                                    isHeading: true,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: ColorsTheme.primary,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 5),
                                  ReText(
                                    text: 'Siomay Street, 43 no. 25',
                                    isHeading: true,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: ColorsTheme.primary,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              ReText(
                                text: 'On The Way',
                                isHeading: true,
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: ColorsTheme.primary,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )),
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
