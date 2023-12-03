import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/storage_constant.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/main_screen/home_page.dart';

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
    print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify',
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    print(response.data);

    if (response.data["response"] == 'verified') {
      var box = GetStorage();
      box.write(token_, response.data["token"]);
      box.write(userId_, response.data["user_id"]);

      print("read::: " + box.read(token_));
      print("read::: " + box.read(userId_));

      Get.to(() => HomePage());
    } else {
      log('Error');
    }
  }
}
