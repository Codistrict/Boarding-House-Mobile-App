import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/colors/colors.dart';
import '../../../widgets/widgets.dart';
import '../controllers/controllers.dart';

Widget packageList(Future future, bool isClickable, bool isHistory, int role,
    NavController controller) {
  return FutureBuilder(
    future: future,
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
                onTap: isClickable
                    ? () {
                        controller.ctrlPackage
                            .getDetailPackage(snapData[2][index]['id_package']);
                        Get.toNamed('/package/detail');
                      }
                    : null,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: ColorsTheme.secondary),
                  ),
                  color: ColorsTheme.onPrimary,
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReText(
                              text: '${snapData[2][index]['no_resi']}',
                              isHeading: true,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: ColorsTheme.primary,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            ReText(
                              text: '${snapData[2][index]['street_name']}',
                              isHeading: true,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: ColorsTheme.primary,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        role == 2 && !isHistory
                            ? ReElevatedButton(
                                onPressed: () {},
                                child: const ReText(
                                  text: 'COMPLETE',
                                  isHeading: true,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  color: ColorsTheme.primary,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : ReText(
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
  );
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
            Get.back();
          },
          child: const Icon(Icons.arrow_back_outlined),
        ),
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
                  ),
                ),
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
