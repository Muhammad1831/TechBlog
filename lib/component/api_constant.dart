class ApiConstant {
  static const String baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const String baseUrlImage = "https://techblog.sasansafari.com";
  static const String getHomeItems = "${baseUrl}home/?command=index";
  static const String getArticleList = "${baseUrl}article/get.php?command=new&user_id=";
  static const String postRegister = "${baseUrl}register/action.php";
  static const String publishedByMe = "${baseUrl}article/get.php?command=published_by_me&user_id=2";
  // static const String getArticleInfo = baseUrl + "/article/get.php?command=info&id=1&user_id=1";
}