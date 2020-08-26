// Generated by https://quicktype.io

class Dates {
  String maximum;
  String minimum;

  Dates({
    this.maximum,
    this.minimum,
  });
}

class Films {
  List<Film> items = new List();

  Films();

  Films.fromJsonList( List<dynamic> jsonList ){
    if( jsonList == null ){
      return;
    }else{
      for ( var item in jsonList ){
        final film = new Film.fromJsonMap(item);
        items.add(film);
      }
    }
  }


}

class Film {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Film({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Film.fromJsonMap( Map<String, dynamic> json ){

    popularity        = json['popularity'] / 1;
    voteCount         = json['vote_count'];
    video             = json['video'];
    posterPath        = json['poster_path'];
    id                = json['id'];
    adult             = json['adult'];
    backdropPath      = json['backdrop_path'];
    originalLanguage  = json['original_language'];
    originalTitle     = json['original_title'];
    genreIds          = json['genre_ids'].cast<int>();
    title             = json['title'];
    voteAverage       = json['vote_average'] / 1;
    overview          = json['overview'];
    releaseDate       = json['release_date'];
  }


  getPosterURL(){
    if(posterPath == null ){
      return 'https://images-na.ssl-images-amazon.com/images/I/71+PKDjuooL.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
    
  }

    getBackgroundPosterURL(){
    if(backdropPath == null ){
      return 'https://images-na.ssl-images-amazon.com/images/I/71+PKDjuooL.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
    
  }

}

