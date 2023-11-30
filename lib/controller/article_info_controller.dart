import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/related_info_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class ArticleInfoController extends GetxController {
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<RelatedInfoModel> relatedInfo = RxList();
  RxList<TagsModel> tagsInfo = RxList();
  RxString appBarTitle = RxString('مقالات جدید');
  RxBool loading = false.obs;
  RxInt id = RxInt(0);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getArticleInfo() async {
    //TODO: implement later
    articleInfoModel = ArticleInfoModel().obs;
    var userId = '';
    loading.value = true;

    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromjson(response.data);

      relatedInfo.clear();
      response.data['related'].forEach((element) {
        relatedInfo.add(RelatedInfoModel.fromjson(element));
      });

      tagsInfo.clear();
      response.data['tags'].forEach((element) {
        tagsInfo.add(TagsModel.fromjson(element));
      });
      loading.value = false;
    }
  }
}
