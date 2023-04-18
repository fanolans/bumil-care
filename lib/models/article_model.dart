class Articles {
  final String id;
  final String title;
  final String article;

  Articles({
    required this.id,
    required this.title,
    required this.article,
  });

  Articles copyWith({
    String? id,
    String? title,
    String? article,
  }) {
    return Articles(
      id: id == null ? this.id : id,
      title: title == null ? this.title : title,
      article: article == null ? this.article : article,
    );
  }
}
