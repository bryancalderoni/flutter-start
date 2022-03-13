class StoryModel {
  final String title;
  final String author;

  StoryModel({required this.title, required this.author});

  factory StoryModel.FormData(Map<String, dynamic> data) {
    final title = data["title"];
    final author = data["by"];

    return StoryModel(title: title, author: author);
  }
}
