import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/storage_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ArticleListController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    loading.value = true;

    DioService dio = DioService();
    var response = await dio.getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });
    }
    loading.value = false;
  }

  getArticleListWithTagId(String id) async {
    loading.value = true;
    articleList.clear();

    DioService dio = DioService();
    var response = await dio.getMethod(
        "${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=${GetStorage().read(StorageKey.userId)}");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromjson(element));
      });
    }
    loading.value = false;
  }
}
