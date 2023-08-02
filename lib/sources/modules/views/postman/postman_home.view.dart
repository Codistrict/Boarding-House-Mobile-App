import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../themes/colors/colors.dart';
import '../../../../widgets/widgets.dart';
import '../../controllers/controllers.dart';
import '../views.dart';

class PostmanHomeView extends GetView<NavController> {
  const PostmanHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
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
            height: 32,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReText(
                text: 'On Progress',
                isHeading: true,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsTheme.primary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 10),
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
                  3,
                  controller,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
                dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
              ),
              child: Obx(
                () => packageList(
                  controller.ctrlPackage.listPackageHistory(),
                  false,
                  true,
                  3,
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
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 12),
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
                          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
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
                          padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
