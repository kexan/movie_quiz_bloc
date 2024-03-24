import 'dart:convert';

class Rating {
  double? kp;

  Rating({
    this.kp,
  });

  Rating copyWith({
    double? kp,
  }) =>
      Rating(
        kp: kp ?? this.kp,
      );

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        kp: json["kp"]?.toDouble(),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "kp": kp,
      };
}
