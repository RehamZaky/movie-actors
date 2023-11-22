import 'package:flutter_assessment_task/shared/data/models/department.dart';

class KnownFor {
  late bool adult;
  late String backdropPath;
  late int id;
  String? title;
  late OriginalLanguage originalLanguage;
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
  List<String>? originCountry;

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
    backdropPath = json['backdropPath'];
    title = json['title'];
    id = json['id'];
    voteCount = json['voteCount'];
    name = json['name'];
    originalName = json['originalName'];
    popularity = json['popularity'];
    firstAirDate = json['firstAirDate'];
    originCountry = json['originCountry'];
    originalLanguage = json['originalLanguage'];
    originalTitle = json['originalTitle'];
    overview = json['overview'];
    posterPath = json['posterPath'];
    mediaType = json['mediaType'];
    genreIds = json['genreIds'];
    popularity = json['popularity'];
    releaseDate = json['releaseDate'];
    video = json['video'];
    voteAverage = json['voteAverage'];
  }
}
