class Article {
  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"] ?? "Tidak ada author",
        title: json["title"] ?? "Tidak ada title",
        description: json["description"] ?? "Tidak ada deskripsi",
        url: json["url"] ?? "Tidak ada url",
        urlToImage: json["urlToImage"] ??
            "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132484366.jpg",
        publishedAt: json["publishedAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? "Tidak ada konten",
      );
}
