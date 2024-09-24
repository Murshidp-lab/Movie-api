part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}
class movieloding extends MovieState{}
class movieloded extends MovieState{}
class movieerror extends MovieState{}