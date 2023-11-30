import 'package:techblog/component/api_constant.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  ArticleInfoModel();

  ArticleInfoModel.fromjson(Map<String, dynamic> element) {
    var info = element["info"];
    id = info["id"];
    title = info["title"];
    content = info["content"];
    image = ApiConstant.baseUrlImage + info["image"];
    catId = info["cat_id"];
    catName = info["cat_name"];
    author = info["author"];
    view = info["view"];
    status = info["status"];
    createdAt = info["created_at"];
    isFavorite = element["isFavorite"];

    // id = element["info"]["id"];
    // title = element["info"]["title"];
    // content = element["info"]["content"];
    // image = ApiConstant.baseUrlImage + element["info"]["image"];
    // catId = element["info"]["cat_id"];
    // catName = element["info"]["cat_name"];
    // author = element["info"]["author"];
    // view = element["info"]["view"];
    // status = element["info"]["status"];
    // createdAt = element["info"]["created_at"];
    // isFavorite = element["isFavorite"];
  }
}
