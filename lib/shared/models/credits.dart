import 'dart:convert';
import 'package:action/shared/models/cast.dart';

class Credits {
  final List<Cast>? cast;
  final List<Cast>? crew;

  Credits({
    this.cast,
    this.crew,
  });

  factory Credits.fromRawJson(String str) => Credits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Credits.fromJson(Map<String, dynamic> json) => Credits(
        cast: json["cast"] == null
            ? []
            : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null
            ? []
            : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cast": cast == null
            ? []
            : List<dynamic>.from(cast!.map((x) => x.toJson())),
        "crew": crew == null
            ? []
            : List<dynamic>.from(crew!.map((x) => x.toJson())),
      };
}
