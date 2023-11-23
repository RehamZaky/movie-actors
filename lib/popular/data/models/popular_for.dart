import 'package:flutter_assessment_task/shared/data/models/department.dart';

class KnownFor {
  late bool adult;
  late String backdropPath;
  late int id;
  String? title;
  late String originalLanguage;
  String? originalTitle;
  late String overview;
  late String posterPath;
  late MediaType mediaType;
  late List<int> genreIds;
  late double popularity;
  DateTime? releaseDate;
  bool? video;
  late double voteAverage;
  late int voteCount;
  String? name;
  String? originalName;
  DateTime? firstAirDate;
  List<dynamic>? originCountry;

  KnownFor({
    required this.adult,
    required this.backdropPath,
    required this.id,
    this.title,
    required this.originalLanguage,
    this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    this.releaseDate,
    this.video,
    required this.voteAverage,
    required this.voteCount,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
  });

  KnownFor.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    title = json['title'];
    id = json['id'];
    voteCount = json['vote_count'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    firstAirDate = json['first_air_date'] != null
        ? DateTime.parse(json['first_air_date'])
        : null;
    //originCountry = json['origin_country'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'] == 'TV' ? MediaType.TV : MediaType.MOVIE;
    //  genreIds = json['genre_ids'];
    popularity = json['popularity'];
    releaseDate = json['release_date'] != null
        ? DateTime.parse(json['release_date'])
        : json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }
}
