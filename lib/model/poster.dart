import 'dart:convert';

class Poster {
  String? previewUrl = "url";

  Poster({
    this.previewUrl,
  });

  Poster copyWith({
    String? previewUrl,
  }) =>
      Poster(
        previewUrl: previewUrl ?? this.previewUrl,
      );

  factory Poster.fromJson(String str) => Poster.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Poster.fromMap(Map<String, dynamic> json) => Poster(
        previewUrl: json["previewUrl"],
      );

  Map<String, dynamic> toMap() => {
        "previewUrl": previewUrl,
      };
}
