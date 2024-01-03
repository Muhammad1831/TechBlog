import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class ArticleManageController extends GetxController {
  RxList<ArticleModel> articleListManage = RxList.empty();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagsModel = RxList.empty();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleManage();
  }

  getArticleManage() async {
    loading.value = true;
    DioService dioService = DioService();
    var response = await dioService.getMethod(ApiConstant.publishedByMe);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleListManage.add(ArticleModel.fromjson(element));
      });
      loading.value = false;
    }
  }
}
