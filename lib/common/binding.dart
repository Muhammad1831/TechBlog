import 'package:get/get.dart';
import 'package:techblog/controller/article/article_info_controller.dart';
import 'package:techblog/controller/article/article_list_controller.dart';
import 'package:techblog/controller/article/article_manage_controller.dart';
import 'package:techblog/controller/file_picker_controller.dart';
import 'package:techblog/controller/register_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ArticleListController());
    Get.lazyPut(() => ArticleInfoController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}

class ManageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ArticleManageController());
  }
}
class FilePickerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FilePickerController());
  }
}
