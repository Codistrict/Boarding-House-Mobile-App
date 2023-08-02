import 'dart:ui';

import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:skripsi_kos_app/widgets/widgets.dart';
import '../../../../themes/colors/colors.dart';
import '../../controllers/controllers.dart';
import '../../views/views.dart';

class AdminNavigationView extends GetView<NavController> {
  AdminNavigationView({super.key});

  final controllerFP = Get.find<FilePickerController>();

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
              text: 'WELCOME, Admin',
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
            Card(
              color: ColorsTheme.primary,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReText(
                        text: 'BIO',
                        isHeading: true,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ColorsTheme.onPrimary,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: ColorsTheme.onPrimary),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReElevatedButton(
                  onPressed: () {
                    Get.toNamed('/admin/resident');
                  },
                  child: const ReText(
                    text: 'Show Resident',
                    color: ColorsTheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
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
            const ReText(
              text: 'History',
              isHeading: true,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorsTheme.primary,
              textAlign: TextAlign.center,
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
                            return GestureDetector(
                              onTap: () {
                                controller.ctrlPackage.getDetailPackage(
                                  snapData[2][index]['id_package'],
                                );
                                Get.toNamed('/admin/detail');
                              },
                              child: Card(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFAB(
        icon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              elevation: 5,
              child: const Icon(
                Icons.file_copy,
                color: ColorsTheme.onPrimary,
              ),
              backgroundColor: ColorsTheme.secondary,
              onTap: () {
                controllerFP.pickFile();
              },
              labelBackgroundColor: ColorsTheme.secondary),
          SpeedDialChild(
              elevation: 5,
              child: const Icon(
                Icons.list_alt,
                color: ColorsTheme.onPrimary,
              ),
              backgroundColor: ColorsTheme.secondary,
              onTap: () {},
              labelBackgroundColor: ColorsTheme.secondary),
          SpeedDialChild(
              elevation: 5,
              child: const Icon(
                Icons.add,
                color: ColorsTheme.onPrimary,
              ),
              backgroundColor: ColorsTheme.secondary,
              onTap: () {},
              labelBackgroundColor: ColorsTheme.secondary),
        ],
      ),
    );
  }
}

class AdminResidentNavigationView extends GetView<ResidentController> {
  const AdminResidentNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsTheme.primary,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_outlined)),
        title: const ReText(
          text: 'RESIDENT',
          isHeading: true,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: ColorsTheme.onPrimary,
          textAlign: TextAlign.center,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 35, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch
                  },
                ),
                child: Obx(
                  () => FutureBuilder(
                    future: controller.listResident(),
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
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 35,
                                            backgroundColor:
                                                ColorsTheme.primary,
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ReText(
                                                text:
                                                    '${snapData[2][index]['name']}',
                                                isHeading: true,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: ColorsTheme.primary,
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 5),
                                              ReText(
                                                text:
                                                    'Room ${snapData[2][index]['room_no']}',
                                                isHeading: true,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: ColorsTheme.primary,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.dialog(
                                            AlertDialog(
                                              title: const ReText(
                                                text: 'Delete Resident',
                                                isHeading: true,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: ColorsTheme.primary,
                                                textAlign: TextAlign.center,
                                              ),
                                              content: const ReText(
                                                text:
                                                    'Are you sure want to delete this resident?',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const ReText(
                                                    text: 'Cancel',
                                                    isHeading: true,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorsTheme.primary,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    controller.delResident(
                                                        snapData[2][index]
                                                            ['resident_id']);
                                                    Get.dialog(
                                                      const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                      barrierDismissible: false,
                                                    );
                                                  },
                                                  child: const ReText(
                                                    text: 'Delete',
                                                    isHeading: true,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorsTheme.primary,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            barrierDismissible: false,
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.cancel_presentation,
                                          color: ColorsTheme.secondary,
                                          size: 35,
                                        ),
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
                              text: 'No Data Found',
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
            ),
          ],
        ),
      ),
    );
  }
}

class DetailTransactionNavigationView extends GetView<NavController> {
  const DetailTransactionNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsTheme.primary,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.toNamed('/admin/nav');
            },
            child: const Icon(Icons.arrow_back_outlined)),
        title: const ReText(
          text: 'Detail Transaction',
          isHeading: true,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: ColorsTheme.onPrimary,
          textAlign: TextAlign.center,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 35, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              color: ColorsTheme.primary,
              child: ListTile(
                title: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReText(
                                  text: 'SPX031415151',
                                  isHeading: true,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsTheme.onPrimary,
                                  textAlign: TextAlign.center,
                                ),
                                ReText(
                                  text: 'Kendrew',
                                  isHeading: true,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsTheme.onPrimary,
                                  textAlign: TextAlign.center,
                                ),
                                ReText(
                                  text: 'Siomay Street',
                                  isHeading: true,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsTheme.onPrimary,
                                  textAlign: TextAlign.center,
                                ),
                                ReText(
                                  text: 'Melati Resident',
                                  isHeading: true,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsTheme.onPrimary,
                                  textAlign: TextAlign.center,
                                ),
                                ReText(
                                  text: 'Room : 505',
                                  isHeading: true,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsTheme.onPrimary,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ReText(
                              text: 'Postman : Nanang',
                              isHeading: true,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: ColorsTheme.onPrimary,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        ReText(
                          text: 'Completed',
                          isHeading: true,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: ColorsTheme.onPrimary,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ),
            ),
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
                  itemCount: 5,
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
                            ReText(
                              text: '19/07/2023',
                              isHeading: true,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: ColorsTheme.primary,
                              textAlign: TextAlign.center,
                            ),
                            ReText(
                              text: 'Recive By Kendrew',
                              isHeading: true,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
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
        ),
      ),
    );
  }
}
