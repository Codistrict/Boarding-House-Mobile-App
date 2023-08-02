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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ReText(
                  text: 'On Going',
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
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch
                  },
                ),
                child: FutureBuilder(
                  future: controller.ctrlPackage.listPackage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List snapData = snapshot.data! as List;
                      if (snapData[0] != 404) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          controller: ScrollController(),
                          physics: const ClampingScrollPhysics(),
                          itemCount: snapData[2].length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    color: ColorsTheme.secondary),
                              ),
                              color: ColorsTheme.onPrimary,
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReText(
                                          text:
                                              '${snapData[2][index]['no_resi']}',
                                          isHeading: true,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: ColorsTheme.primary,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 5),
                                        ReText(
                                          text:
                                              '${snapData[2][index]['street_name']}',
                                          isHeading: true,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: ColorsTheme.primary,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    ReText(
                                      text: '${snapData[2][index]['status']}',
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
                        );
                      } else if (snapData[0] == 404) {
                        return const Center(
                          child: ReText(
                            text: 'No Data',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorsTheme.primary,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
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
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch
                  },
                ),
                child: FutureBuilder(
                  future: controller.ctrlPackage.listPackageHistory(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List snapData = snapshot.data! as List;
                      if (snapData[0] != 404) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          controller: ScrollController(),
                          physics: const ClampingScrollPhysics(),
                          itemCount: snapData[2].length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    color: ColorsTheme.secondary),
                              ),
                              color: ColorsTheme.onPrimary,
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReText(
                                          text:
                                              '${snapData[2][index]['no_resi']}',
                                          isHeading: true,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: ColorsTheme.primary,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 5),
                                        ReText(
                                          text:
                                              '${snapData[2][index]['street_name']}',
                                          isHeading: true,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: ColorsTheme.primary,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    ReText(
                                      text: '${snapData[2][index]['status']}',
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
                        );
                      } else if (snapData[0] == 404) {
                        return const Center(
                          child: ReText(
                            text: 'No Data',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorsTheme.primary,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
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
