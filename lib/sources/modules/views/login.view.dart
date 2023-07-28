import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skripsi_kos_app/themes/colors/colors.dart';
import 'package:skripsi_kos_app/widgets/widgets.dart';
import '../controllers/controllers.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          controller: ScrollController(),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 56,
              horizontal: 48,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReText(
                  text: controller.role() == 1
                      ? 'User'
                      : controller.role() == 2
                          ? 'Postman'
                          : 'Admin',
                  isHeading: true,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 56, top: 12),
                  child: Icon(
                    controller.role() == 1
                        ? IconsaxBold.user_square
                        : controller.role() == 2
                            ? IconsaxBold.box
                            : IconsaxBold.key,
                    color: ColorsTheme.primary,
                    size: 160,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ReText(
                      text: 'Email',
                      fontWeight: FontWeight.w600,
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    ),
                    ReTextField(
                      textController: controller.textCtrlEmail(),
                      hintText: 'Please type your email here!',
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
                      text: 'Password',
                      fontWeight: FontWeight.w600,
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                    ),
                    ReTextField(
                      textController: controller.textCtrlPassword(),
                      hintText: 'Please type your password here!',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                ReElevatedButton(
                  onPressed: () {
                    controller.signIn();
                  },
                  child: const ReText(
                    text: 'Sign In',
                    color: ColorsTheme.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (controller.role() != 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Divider(),
                      const SizedBox(
                        height: 16,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          const ReText(text: 'Dont have account? '),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/signup');
                            },
                            child: const ReText(
                              text: 'Sign Up',
                              color: ColorsTheme.secondary,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
