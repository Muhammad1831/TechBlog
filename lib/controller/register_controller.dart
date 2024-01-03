import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/common/route_to_write_bottom_sheet.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/my_colors.dart';
import 'package:techblog/component/storage_constant.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/main_screen/home_page.dart';
import 'package:techblog/view/register/register_techblog.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController =
      TextEditingController();

  String? email;
  String? userId;

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegister);

    email = emailTextEditingController.text;
    userId = response.data["user_id"];
    debugPrint(response.toString());
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify',
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    debugPrint(response.data.toString());

    var status = response.data["response"];
    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey.token, response.data["token"]);
        box.write(StorageKey.userId, response.data["user_id"]);

        debugPrint("read::: ${box.read(StorageKey.token)}");
        debugPrint("read::: ${box.read(StorageKey.userId)}");

        Get.off(() => HomePage());
        break;
      case 'incorrect_code':
        Get.snackbar('ERROR', 'active code is incorrect',
            animationDuration: const Duration(microseconds: 600),
            backgroundColor: SolidColors.snackBarBackgroundColor,
            colorText: Colors.white,
            snackStyle: SnackStyle.FLOATING);
        break;
      case 'expired':
        Get.snackbar('ERROR', 'active code is expired',
            animationDuration: const Duration(microseconds: 600),
            backgroundColor: SolidColors.snackBarBackgroundColor,
            colorText: Colors.white);
        break;
      default:
    }
  }

  login() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegisterTechBlog());
    } else {
      RouteToWriteBottomSheet().routeToWriteBottomSheet();
    }
  }
}
