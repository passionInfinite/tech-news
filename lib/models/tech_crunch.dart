class TechCrunch {
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  TechCrunch(this.title, this.description, this.url, this.urlToImage,
      this.publishedAt);

  static String _getDate(String date) {
    List<String> dateChunks = date.split("T");
    return dateChunks[0];
  }

  static List<TechCrunch> getAll(List json) {
    List<TechCrunch> techCrunchNews = new List<TechCrunch>();
    for (int i = 0; i < json.length; i++) {
      techCrunchNews.add(new TechCrunch(json[i]['title'], json[i]['description'],
          json[i]['url'], json[i]['urlToImage'], _getDate(json[i]['publishedAt'])));
    }
    return techCrunchNews;
  }
}
