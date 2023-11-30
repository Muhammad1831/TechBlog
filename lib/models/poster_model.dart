import 'package:techblog/component/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  // Map<String, dynamic> : این قسمت یعنی کلید حتما استرینگ هست ولی مقدار می تونه از هر نوعی باشد
  PosterModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstant.baseUrlImage + element["image"];
  }
}
