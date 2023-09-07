import 'dart:convert';

class Network {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  Network({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory Network.fromRawJson(String str) => Network.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}
