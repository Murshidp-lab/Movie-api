import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled6/repository/api/movie/movie.dart';
import 'package:untitled6/repository/model%20class/movie%20%20model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  late Moviemodel moviemodel;
  MovieApi movieApi=MovieApi();
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      emit(movieloding());
      try {
        moviemodel = await movieApi.getMOVIE();
        emit(movieloded());
      } catch (e) {
        emit(movieerror());
      }
    });
     }
}
