import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster = PosterModel().obs;
  late RxList<TagsModel> tagList = RxList();
  late RxList<ArticleModel> topVisitedPosts = RxList();
  late RxList<PodcastModel> topVisitedPodcast = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;

    DioService dio = DioService();
    var response = await dio.getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedPosts.add(ArticleModel.fromjson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topVisitedPodcast.add(PodcastModel.fromjson(element));
      });
      response.data['tags'].forEach((element) {
        tagList.add(TagsModel.fromjson(element));
      });
      poster.value = PosterModel.fromjson(response.data['poster']);
    }

    loading.value = false;
  }
}