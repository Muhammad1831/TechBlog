class TagsModel {
  String? id;
  String? title;

  TagsModel({
    required this.id,
    required this.title,
  });

  // Map<String, dynamic> : این قسمت یعنی کلید حتما استرینگ هست ولی مقدار می تونه از هر نوعی باشد
  TagsModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}
