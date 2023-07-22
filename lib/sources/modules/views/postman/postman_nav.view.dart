import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:skripsi_kos_app/widgets/widgets.dart';
import '../../../../themes/colors/colors.dart';
import '../../controllers/controllers.dart';
import '../../views/views.dart';
import '../../models/models.dart';
import '../../../services/services.dart';

import 'dart:ui';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class PostmanNavigationView extends GetView<NavController> {
  const PostmanNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReText(
                text: 'WELCOME, Postman',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFAB(
        icon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              elevation: 5,
              child: const Icon(
                Icons.camera_alt,
                color: ColorsTheme.onPrimary,
              ),
              backgroundColor: ColorsTheme.secondary,
              onTap: () {},
              labelBackgroundColor: ColorsTheme.secondary),
          // FAB 2
          SpeedDialChild(
              elevation: 5,
              child: const Icon(
                Icons.add,
                color: ColorsTheme.onPrimary,
              ),
              backgroundColor: ColorsTheme.secondary,
              onTap: () {
                Get.toNamed('/postman/form');
              },
              labelBackgroundColor: ColorsTheme.secondary),
        ],
      ),
    );
  }
}

class PostmanFormPageNavigationView extends GetView<NavController> {
  const PostmanFormPageNavigationView({super.key});

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
              Get.toNamed('/postman/nav');
            },
            child: const Icon(Icons.arrow_back_outlined)),
        title: const ReText(
          text: 'Form Input',
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
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                    controller: ScrollController(),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ReText(
                              text: 'Resi Number',
                              fontWeight: FontWeight.w600,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                            ),
                            ReTextField(
                              textController: TextEditingController(),
                              hintText: 'Please type your Resi Number here!',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ReText(
                              text: 'Name',
                              fontWeight: FontWeight.w600,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                            ),
                            ReTextField(
                              textController: TextEditingController(),
                              hintText: 'Please type your Name here!',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ReText(
                              text: 'Street',
                              fontWeight: FontWeight.w600,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                            ),
                            ReTextField(
                              textController: TextEditingController(),
                              hintText: 'Please type your Street here!',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ReText(
                              text: 'Building Name',
                              fontWeight: FontWeight.w600,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                            ),
                            ReTextField(
                              textController: TextEditingController(),
                              hintText: 'Please type your Building Name here!',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ReText(
                              text: 'Room Number',
                              fontWeight: FontWeight.w600,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                            ),
                            ReTextField(
                              textController: TextEditingController(),
                              hintText: 'Please type your Room Number here!',
                            ),
                          ],
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReElevatedButton(
                              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                              onPressed: () {
                                controller.ctrlAuth.signOut();
                              },
                              child: const ReText(
                                text: 'Submit',
                                color: ColorsTheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            ReElevatedButton(
                              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                              onPressed: () {
                                controller.ctrlAuth.signOut();
                              },
                              backgroundColor: ColorsTheme.primary,
                              child: const ReText(
                                text: 'Cancel',
                                color: ColorsTheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}

class CustomFAB extends StatefulWidget {
  final double? size;
  final Curve curve;
  final bool visible;
  final Color iconColor;
  final Color backgroundColor;
  final List<SpeedDialChild> children;
  final AnimatedIconData icon;
  const CustomFAB(
      {super.key,
      this.size = 25,
      this.curve = Curves.bounceIn,
      this.visible = true,
      this.iconColor = ColorsTheme.onPrimary,
      this.backgroundColor = ColorsTheme.secondary,
      required this.icon,
      required this.children});

  @override
  State<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: widget.icon,
      animatedIconTheme:
          IconThemeData(size: widget.size, color: widget.iconColor),
      backgroundColor: widget.backgroundColor,
      visible: widget.visible,
      curve: widget.curve,
      children: widget.children,
    );
  }
}
