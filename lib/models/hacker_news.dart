class HackerNews {
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  HackerNews(this.title, this.description, this.url, this.urlToImage,
      this.publishedAt);

  static String _getDate(String date) {
    List<String> dateChunks = date.split("T");
    return dateChunks[0];
  }

  static List<HackerNews> getAll(List json) {
    List<HackerNews> hackerNews = new List<HackerNews>();
    for (int i = 0; i < json.length; i++) {
      hackerNews.add(new HackerNews(json[i]['title'], json[i]['description'],
          json[i]['url'], json[i]['urlToImage'], _getDate(json[i]['publishedAt']))
      );
    }
    return hackerNews;
  }
}
