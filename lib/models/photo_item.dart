import 'dart:convert';

List<PhotoItem> imageFromJson(String str) =>
    List<PhotoItem>.from(json.decode(str).map((x) => PhotoItem.fromJson(x)));

String imageToJson(List<PhotoItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoItem {
  PhotoItem({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotoItem.fromJson(Map<String, dynamic> json) => PhotoItem(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
