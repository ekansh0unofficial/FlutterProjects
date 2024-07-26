part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnClickFav extends HomeEvent {}

class OnClickCart extends HomeEvent {}

class OnNavigateCart extends HomeEvent {}

class OnNavigateFav extends HomeEvent {}

class FetchHome extends HomeEvent {}
