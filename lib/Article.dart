class Article {
  int? id;
  String? author;
  String? title;
  String? date;

  Article({this.id, this.author, this.title, this.date});

  factory Article.fromJson(json) =>
      Article(
        id: json['id'] as int?,
        author: json['author'] as String?,
        title: json['title'] as String?,
        date: json['date'] as String?,
      );

  toJson() =>
      {
        'id': id,
        'author': author,
        'title': title,
        'image': date,
      };



}
class ArticlesList {
  late final List<Article> items;
  ArticlesList({
    required this.items,

  });
  factory ArticlesList.fromJson(List<dynamic> list) {
    return ArticlesList(
      items: list.map((data) => Article.fromJson(data)).toList(),
    );
  }
}