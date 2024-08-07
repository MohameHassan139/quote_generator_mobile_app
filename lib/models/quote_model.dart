import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Quote extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? content;
  @HiveField(2)
  String? author;
  @HiveField(3)
  List<String>? tags;
  @HiveField(4)
  String? authorSlug;
  @HiveField(5)
  int? length;
  @HiveField(6)
  String? dateAdded;
  @HiveField(7)
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




class QuoteAdapter extends TypeAdapter<Quote> {
  @override
  final int typeId = 0;

  @override
  Quote read(BinaryReader reader) {
    return Quote(
      id: reader.readString(),
      content: reader.readString(),
      author: reader.readString(),
      tags: reader.readList()?.cast<String>(),
      authorSlug: reader.readString(),
      length: reader.readInt(),
      dateAdded: reader.readString(),
      dateModified: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Quote obj) {
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.content ?? '');
    writer.writeString(obj.author ?? '');
    writer.writeList(obj.tags ?? []);
    writer.writeString(obj.authorSlug ?? '');
    writer.writeInt(obj.length ?? 0);
    writer.writeString(obj.dateAdded ?? '');
    writer.writeString(obj.dateModified ?? '');
  }
}
