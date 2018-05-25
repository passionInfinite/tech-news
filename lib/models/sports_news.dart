class SportsNews {
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  SportsNews(this.title, this.description, this.url, this.urlToImage,
      this.publishedAt);

  static String _getDate(String date) {
    List<String> dateChunks = date.split("T");
    return dateChunks[0];
  }

  static List<SportsNews> getAll(List json) {
    List<SportsNews> sportsNews = new List<SportsNews>();
    for (int i = 0; i < json.length; i++) {
      sportsNews.add(new SportsNews(json[i]['title'], json[i]['description'],
          json[i]['url'], json[i]['urlToImage'], _getDate(json[i]['publishedAt']))
      );
    }
    return sportsNews;
  }
}
