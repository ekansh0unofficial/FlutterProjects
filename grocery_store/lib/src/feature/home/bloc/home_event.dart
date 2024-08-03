part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnClickFav extends HomeEvent {}

class OnClickCart extends HomeEvent {}

class OnNavigateHomeTOCart extends HomeEvent {}

class OnNavigateHomeTOFav extends HomeEvent {}

class FetchHome extends HomeEvent {}
