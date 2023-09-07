import 'dart:convert';

class Person {
  final bool? adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final DateTime? birthday;
  final dynamic deathday;
  final int? gender;
  final dynamic homepage;
  final int? id;
  final String? imdbId;
  final String? knownForDepartment;
  final String? name;
  final String? placeOfBirth;
  final double? popularity;
  final String? profilePath;
  final MovieCredits? movieCredits;
  final TvCredits? tvCredits;

  Person({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
    this.movieCredits,
    this.tvCredits,
  });

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        adult: json["adult"],
        alsoKnownAs: json["also_known_as"] == null
            ? []
            : List<String>.from(json["also_known_as"]!.map((x) => x)),
        biography: json["biography"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        movieCredits: json["movie_credits"] == null
            ? null
            : MovieCredits.fromJson(json["movie_credits"]),
        tvCredits: json["tv_credits"] == null
            ? null
            : TvCredits.fromJson(json["tv_credits"]),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "also_known_as": alsoKnownAs == null
            ? []
            : List<dynamic>.from(alsoKnownAs!.map((x) => x)),
        "biography": biography,
        "birthday":
            "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "deathday": deathday,
        "gender": gender,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
        "movie_credits": movieCredits?.toJson(),
        "tv_credits": tvCredits?.toJson(),
      };
}

class MovieCredits {
  final List<MovieCreditsCast>? cast;
  final List<MovieCreditsCast>? crew;

  MovieCredits({
    this.cast,
    this.crew,
  });

  factory MovieCredits.fromRawJson(String str) =>
      MovieCredits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieCredits.fromJson(Map<String, dynamic> json) => MovieCredits(
        cast: json["cast"] == null
            ? []
            : List<MovieCreditsCast>.from(
                json["cast"]!.map((x) => MovieCreditsCast.fromJson(x))),
        crew: json["crew"] == null
            ? []
            : List<MovieCreditsCast>.from(
                json["crew"]!.map((x) => MovieCreditsCast.fromJson(x))),
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

class MovieCreditsCast {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? character;
  final String? creditId;
  final int? order;
  final String? department;
  final String? job;

  MovieCreditsCast({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory MovieCreditsCast.fromRawJson(String str) =>
      MovieCreditsCast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieCreditsCast.fromJson(Map<String, dynamic> json) =>
      MovieCreditsCast(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}

class TvCredits {
  final List<TvCreditsCast>? cast;
  final List<TvCreditsCast>? crew;

  TvCredits({
    this.cast,
    this.crew,
  });

  factory TvCredits.fromRawJson(String str) =>
      TvCredits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TvCredits.fromJson(Map<String, dynamic> json) => TvCredits(
        cast: json["cast"] == null
            ? []
            : List<TvCreditsCast>.from(
                json["cast"]!.map((x) => TvCreditsCast.fromJson(x))),
        crew: json["crew"] == null
            ? []
            : List<TvCreditsCast>.from(
                json["crew"]!.map((x) => TvCreditsCast.fromJson(x))),
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

class TvCreditsCast {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;
  final String? character;
  final String? creditId;
  final int? episodeCount;
  final String? department;
  final String? job;

  TvCreditsCast({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
    this.character,
    this.creditId,
    this.episodeCount,
    this.department,
    this.job,
  });

  factory TvCreditsCast.fromRawJson(String str) =>
      TvCreditsCast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TvCreditsCast.fromJson(Map<String, dynamic> json) => TvCreditsCast(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        firstAirDate:
            json["first_air_date"] == null || json["first_air_date"] == ''
                ? null
                : DateTime.parse(json["first_air_date"]),
        name: json["name"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        character: json["character"],
        creditId: json["credit_id"],
        episodeCount: json["episode_count"],
        department: json["department"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "character": character,
        "credit_id": creditId,
        "episode_count": episodeCount,
        "department": department,
        "job": job,
      };
}
