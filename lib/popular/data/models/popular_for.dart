
import 'package:flutter_assessment_task/shared/data/models/department.dart';

class KnownFor {
    bool adult;
    String backdropPath;
    int id;
    String? title;
    OriginalLanguage originalLanguage;
    String? originalTitle;
    String overview;
    String posterPath;
    MediaType mediaType;
    List<int> genreIds;
    double popularity;
    DateTime? releaseDate;
    bool? video;
    double voteAverage;
    int voteCount;
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

}
