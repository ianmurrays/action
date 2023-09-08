import 'dart:convert';

class Role {
  final String? creditId;
  final String? character;
  final int? episodeCount;

  Role({
    this.creditId,
    this.character,
    this.episodeCount,
  });

  factory Role.fromRawJson(String str) => Role.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        creditId: json["credit_id"],
        character: json["character"],
        episodeCount: json["episode_count"],
      );

  Map<String, dynamic> toJson() => {
        "credit_id": creditId,
        "character": character,
        "episode_count": episodeCount,
      };
}
