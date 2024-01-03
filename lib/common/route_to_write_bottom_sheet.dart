import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:techblog/common/route_page.dart';
import 'package:techblog/gen/assets.gen.dart';

// ignore: camel_case_types
class RouteToWriteBottomSheet {
  routeToWriteBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 3,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 28, 0),
          child: Column(children: [
            Row(
              children: [
                SvgPicture.asset(
                  Assets.images.happyGuideRobot.path,
                  height: 52,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'دونسته هات رو با بقیه به اشتراک بذار ...',
                  style: TextStyle(
                      fontFamily: 'iran',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              '''فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..''',
              style: TextStyle(
                  fontFamily: 'iran',
                  fontSize: 14,
                  color: Color.fromARGB(255, 72, 72, 72),
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offNamed(RoutePage.articleManage);
                    debugPrint("مقاله");
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.pencilBottomsheet.path,
                          height: 44,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'مدیریت مقاله ها',
                          style: TextStyle(
                              fontFamily: 'iran',
                              fontSize: 14.5,
                              color: Color.fromARGB(255, 72, 72, 72),
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint("پادکست");
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.microphon.path,
                          height: 48,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'مدیریت پادکست ها',
                          style: TextStyle(
                              fontFamily: 'iran',
                              fontSize: 14.5,
                              color: Color.fromARGB(255, 72, 72, 72),
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
      backgroundColor: Colors.red,
    );
  }
}
