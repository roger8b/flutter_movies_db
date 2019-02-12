// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) {
  final jsonData = json.decode(str);
  return ItemModel.fromJson(jsonData);
}

String itemModelToJson(ItemModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ItemModel {
  int page;
  int totalResults;
  int totalPages;
  List<Result> results;

  ItemModel({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => new ItemModel(
    page: json["page"] == null ? null : json["page"],
    totalResults: json["total_results"] == null ? null : json["total_results"],
    totalPages: json["total_pages"] == null ? null : json["total_pages"],
    results: json["results"] == null ? null : new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "total_results": totalResults == null ? null : totalResults,
    "total_pages": totalPages == null ? null : totalPages,
    "results": results == null ? null : new List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Result({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => new Result(
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
    id: json["id"] == null ? null : json["id"],
    video: json["video"] == null ? null : json["video"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    title: json["title"] == null ? null : json["title"],
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    genreIds: json["genre_ids"] == null ? null : new List<int>.from(json["genre_ids"].map((x) => x)),
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    adult: json["adult"] == null ? null : json["adult"],
    overview: json["overview"] == null ? null : json["overview"],
    releaseDate: json["release_date"] == null ? null : json["release_date"],
  );

  Map<String, dynamic> toJson() => {
    "vote_count": voteCount == null ? null : voteCount,
    "id": id == null ? null : id,
    "video": video == null ? null : video,
    "vote_average": voteAverage == null ? null : voteAverage,
    "title": title == null ? null : title,
    "popularity": popularity == null ? null : popularity,
    "poster_path": posterPath == null ? null : posterPath,
    "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle == null ? null : originalTitle,
    "genre_ids": genreIds == null ? null : new List<dynamic>.from(genreIds.map((x) => x)),
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "adult": adult == null ? null : adult,
    "overview": overview == null ? null : overview,
    "release_date": releaseDate == null ? null : releaseDate,
  };
}

enum OriginalLanguage { RU, EN, JA }

final originalLanguageValues = new EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "ru": OriginalLanguage.RU
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
