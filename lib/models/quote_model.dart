class Quote {
  String? id;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Quote(
      {this.id,
      this.content,
      this.author,
      this.tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified});

  Quote.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    content = json["content"];
    author = json["author"];
    tags = json["tags"] == null ? null : List<String>.from(json["tags"]);
    authorSlug = json["authorSlug"];
    length = json["length"];
    dateAdded = json["dateAdded"];
    dateModified = json["dateModified"];
  }

  static List<Quote> fromList(List<dynamic> list) {
    return list
        .map((item) => Quote.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["content"] = content;
    _data["author"] = author;
    if (tags != null) {
      _data["tags"] = tags;
    }
    _data["authorSlug"] = authorSlug;
    _data["length"] = length;
    _data["dateAdded"] = dateAdded;
    _data["dateModified"] = dateModified;
    return _data;
  }
}
