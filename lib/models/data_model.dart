class HashTagModel {
  String tag_name;
  HashTagModel({required this.tag_name});
}

class BlogPageModel {
  int id;
  String imageURL;
  String title;
  String imageWriterURL;
  String writer;
  String timePublication;
  String content;
  String views;

  BlogPageModel({
    required this.id,
    required this.imageURL,
    required this.title,
    required this.imageWriterURL,
    required this.writer,
    required this.timePublication,
    required this.content,
    required this.views,
  });
}
