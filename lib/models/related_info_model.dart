import 'package:techblog/component/api_constant.dart';

class RelatedInfoModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  RelatedInfoModel();

  RelatedInfoModel.fromjson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    image = ApiConstant.baseUrlImage + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
  }
}
